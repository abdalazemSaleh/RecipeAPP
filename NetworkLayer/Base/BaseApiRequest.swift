//
//  BaseApiRequest.swift
//
//
//  Created by Abdalazem Saleh on 2024-03-17.
//

import Foundation

enum BaseAPIRequest: APIRequestConfiguration {
    
    var images: ImageDictionary? {
        return nil
    }
    
    // MARK: - HTTPMethod
    
    internal var method: HTTPMethod {
      switch self {
        default:
          return .get
      }
    }

    // MARK: - Path
    
    internal var path: String {
      return ""
    }

    // MARK: - Query Parameters
    
    var queryParameters: QueryParameters? {
        return nil
    }
    
    // MARK: - Parameters
    
    internal var parameters: Parameters? {
      return nil
    }

    // MARK: - Headers
    
    internal var headers: HTTPHeaders? {
      return nil
    }
}
