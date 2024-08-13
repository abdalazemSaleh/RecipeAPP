//
//  HTTPMethod.swift
//
//
//  Created by Abdalazem Saleh on 2024-03-17.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    case update
    case delete
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .update:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}
