//
//  APIError.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/26/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidData
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        }
    }
}
