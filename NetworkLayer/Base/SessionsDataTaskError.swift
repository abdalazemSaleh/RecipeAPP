//
//  SessionsDataTaskError.swift
//
//
//  Created by Abdalazem Saleh on 2024-03-17.
//

import Foundation

enum SessionDataTaskError: Error {
    case failWithError(Error)
    case noData
    case notFound
    case notAuthorized
    case server
    case noInternetConnection
    case unknow
    case invalidURL
}
