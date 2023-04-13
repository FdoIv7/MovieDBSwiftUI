//
//  MovieService.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 11/04/23.
//

import Foundation

protocol MovieRequestService  {
    func getMovies(from: MovieRequest) async throws -> [Movie]
    func getSingleMovie(with id: Int) async throws -> Movie
    func searchMovie(query: String) async throws -> Movie
}

enum MovieListEndPoint: String {
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular

    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Return"
        }
    }
}

enum MovieError: Error {
    case APIError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError

    var localizedDescription: String {
        switch self {
        case .APIError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to parse JSON and decode data"
        }
    }
}
