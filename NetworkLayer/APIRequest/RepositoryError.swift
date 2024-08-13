//
//  RepositoryError.swift
//  Rahal
//
//  Created by Abdalazem Saleh on 2024-05-08.
//

import Foundation

enum RepositoryError: Error {
  case noInternetConnection
  case notFound
  case notAuthorized
  case server
  case noData
  case unowned

  init(error: SessionDataTaskError) {
    switch error {
      case .noInternetConnection:
        self = .noInternetConnection
      case .server:
        self = .server
      case .notFound:
        self = .notFound
      case .notAuthorized:
        self = .notAuthorized
      default:
        self = .unowned
    }
  }
}
