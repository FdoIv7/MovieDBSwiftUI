//
//  APIManagerService.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 12/04/23.
//

import Foundation

protocol APIManagerServiceProtocol {
    func perform(_ request: URLRequest) async throws -> Data
}

class APIManager: APIManagerServiceProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    // TODO: Refactor this and the RequestProtocol
    private func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<300 ~= statusCode else {
            throw NetworkError.APIError
        }
        return data
    }

    func perform(_ request: URLRequest) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request)
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<300 ~= statusCode else {
            throw NetworkError.APIError
        }
        return data
    }
}
