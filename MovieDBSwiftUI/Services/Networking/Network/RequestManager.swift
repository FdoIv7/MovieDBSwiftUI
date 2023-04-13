//
//  RequestManager.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 12/04/23.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {

    let apiManager: APIManagerServiceProtocol
    let parser: DataParserService

    init(apiManager: APIManagerServiceProtocol = APIManager(), parser: DataParserService = DataParser()) {
        self.apiManager = apiManager
        self.parser = parser
    }

    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request.createURLRequest())
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
