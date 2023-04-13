//
//  Utilities.swift
//  MovieDBSwiftUI
//
//  Created by Fernando Ives on 11/04/23.
//

import Foundation

class Utilities {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}
