//
//  RequestProtocol.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 12/04/23.
//

import Foundation

protocol RequestProtocol {
    // path - is the Endpoint
    var path: String { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
    var addAPIKey: Bool { get }
    var requestType: RequestType { get }
}

extension RequestProtocol {
    /// Giving a default implementation of the RequestProtocol, so we won't need to define all of these properties when confirming to it
    var host: String {
        Constants.Networking.baseURL
    }

    var path: String {
        MovieListEndPoint.popular.rawValue
    }

    var addAPIKey: Bool {
        true
    }

    var params: [String: Any] {
        [:]
    }

    var urlParams: [String: String?] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }

    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map({ params in
                URLQueryItem(name: params.key, value: params.value)
            })
        }

        guard let url = components.url else { throw NetworkError.invalidURL }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        /// Use this if we have need for Authorization Tokens, inject them to the createURLRequest function as createURLRequest(token:)
        if addAPIKey {
            let authToken = ""
            urlRequest.setValue(Constants.Networking.apiKey, forHTTPHeaderField: "api_key")
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        return urlRequest
    }
}

enum NetworkError: Error {
    case invalidURL
    case APIError

    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .APIError: return "API Error"
        }
    }
}
