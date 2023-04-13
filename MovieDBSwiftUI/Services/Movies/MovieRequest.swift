//
//  MovieRequest.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 12/04/23.
//

import Foundation

enum MovieRequest: RequestProtocol {
    case getSingleMovie
    case getPopularMovies
    case getNowPlaying
    case getTopRated
    case getUpcoming

    var requestType: RequestType {
        .GET
    }

    var path: String {
        switch self {
        case .getNowPlaying: return MovieListEndPoint.nowPlaying.rawValue
        case .getPopularMovies: return MovieListEndPoint.popular.rawValue
        case .getSingleMovie: return MovieListEndPoint.nowPlaying.rawValue
        case .getTopRated: return MovieListEndPoint.topRated.rawValue
        case .getUpcoming: return MovieListEndPoint.upcoming.rawValue
        }
    }
}
