//
//  MovieStore.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 11/04/23.
//

import Foundation

class MovieStore: MovieRequestService {
    static let shared = MovieStore()
    private let requestManager = RequestManager()

    private init() {}
    
    func getMovies(from movieRequest: MovieRequest) async throws -> [Movie] {
        do {
            return try await requestManager.perform(movieRequest)
        } catch {
            throw MovieError.APIError
        }
    }
    
    func getSingleMovie(with id: Int) async throws -> Movie {
        do {
            return try await requestManager.perform(MovieRequest.getSingleMovie)
        } catch {
            throw MovieError.APIError
        }
    }
    
    func searchMovie(query: String) async throws -> Movie {
        return Movie(id: 1, title: "", backdropPath: "", posterPath: "", releaseDate: nil, originalLanguage: "", overview: "", adult: false)
    }
}
