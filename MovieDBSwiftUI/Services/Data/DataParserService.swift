//
//  DataParserService.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 12/04/23.
//

import Foundation

protocol DataParserService {
    func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser: DataParserService {
    private var decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
        //self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func parse<T: Decodable>(data: Data) throws -> T where T : Decodable {
        return try decoder.decode(T.self, from: data)
    }
}
