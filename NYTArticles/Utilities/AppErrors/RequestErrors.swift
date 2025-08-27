//
//  RequestErrors.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation

enum RequestError: Error, Identifiable {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case badRequest

    var id: String {
        return UUID().uuidString
    }
}

extension RequestError: LocalizedError {
    // Using userFriendlyMessage instead of errorDescription
    public var errorDescription: String? {
        switch self {
        case .decode:
            return "Failed to decode the response. Please try again."
        case .invalidURL:
            return "Invalid URL. Please check your configuration."
        case .noResponse:
            return "No response from server. Please check your connection."
        case .unauthorized:
            return "Unauthorized access. Please check your API key."
        case .unexpectedStatusCode:
            return "Server returned an unexpected response. Please try again."
        case .badRequest:
            return "Bad request. Please try again."
        case .unknown:
            return "An unknown error occurred. Please try again."
        }
    }

    /// Logs the error for debugging purposes
    func logError() {
        print("Request Error: \(self.errorDescription ?? "")")
    }
    
    /// Handles the error by logging it and returning the user-friendly message
    /// - Returns: User-friendly error message
    static func handle(_ error: RequestError) -> String {
        error.logError()
        return error.errorDescription ?? ""
    }
}

