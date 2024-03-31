//
//  CoinError.swift
//  MyCryptoTracker
//
//  Created by Naveen Keerthy on 3/30/24.
//

import Foundation

enum CoinError: Error, LocalizedError {
    case invalidURL
    case invalidData
    case serverError
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid. Please try again later"
        case .invalidData:
            return "The coin data is invalid. Please try again later"
        case .serverError:
            return "There was an error with the server. Please try again later"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
