//
//  NetworkConstant.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation
import Combine


protocol HttpClient{
    func performRequest<T: Decodable>(endPoint: EndPoint) -> AnyPublisher<T, Error>
}

extension HttpClient{
    
    func urlComponentBuilder(endpoint: EndPoint) -> URLComponents{
        let urlComponents = URLComponents(string: URLEndpoints.weather + endpoint.path) ?? .init()
        print("url ==> \(urlComponents)")
        return urlComponents
    }
    
    func urlRequestBuilder(url: URL,
                           endPoint: EndPoint) -> URLRequest{
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header
        return request
    }
    
    func performRequest<T: Decodable>(endPoint: EndPoint) -> AnyPublisher<T, Error> {
        let components = urlComponentBuilder(endpoint: endPoint)
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        let request = urlRequestBuilder(url: url, endPoint: endPoint)

        // Configure your decoder as needed
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared.dataTaskPublisher(for: request)
            // Validate HTTP status code
            .tryMap { output -> Data in
                guard let http = output.response as? HTTPURLResponse,
                      200..<300 ~= http.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            // Decode to the requested type
            .decode(type: T.self, decoder: decoder)
            // (Optional) retry transient failures once
            //.retry(1)
            .eraseToAnyPublisher()
    }
}
