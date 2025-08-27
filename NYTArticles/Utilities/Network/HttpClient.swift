//
//  NetworkConstant.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation
import Combine

protocol HttpClient {
    func performRequest<T: Decodable>(endPoint: EndPoint) -> AnyPublisher<T, RequestError>
}

extension HttpClient {

    func urlComponentBuilder(endpoint: EndPoint) -> URLComponents {
        var components = URLComponents(string: URLEndpoints.weather + endpoint.path) ?? .init()
        
        // Add query items if they exist
        if let queryItems = endpoint.queryItems {
            components.queryItems = queryItems
        }
        
        print("url ==> \(components)")
        print("queryItems ==> \(components.queryItems ?? [])")
        return components
    }

    func urlRequestBuilder(url: URL, endPoint: EndPoint) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header
        return request
    }

    func performRequest<T: Decodable>(endPoint: EndPoint) -> AnyPublisher<T, RequestError> {
        let components = urlComponentBuilder(endpoint: endPoint)
        guard let url = components.url else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }

        let request = urlRequestBuilder(url: url, endPoint: endPoint)

        let decoder = JSONDecoder()

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output -> Data in
                // No HTTP response at all
                guard let http = output.response as? HTTPURLResponse else {
                    throw RequestError.noResponse
                }
                                
                // Map status codes
                switch http.statusCode {
                case 200..<300:
                    return output.data
                case 400:  throw RequestError.badRequest
                case 401:  throw RequestError.unauthorized
                default:   throw RequestError.unexpectedStatusCode
                }
            }
            .decode(type: T.self, decoder: decoder)
            // Map all errors into your RequestError
            .mapError { error -> RequestError in
                if let requestError = error as? RequestError {
                    return requestError
                } else if error is DecodingError {
                    return .decode
                } else if let urlErr = error as? URLError {
                    switch urlErr.code {
                    case .badURL:                 return .invalidURL
                    case .timedOut,
                         .cannotFindHost,
                         .cannotConnectToHost,
                         .networkConnectionLost,
                         .notConnectedToInternet: return .noResponse
                    default:                      return .unknown
                    }
                } else {
                    return .unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
