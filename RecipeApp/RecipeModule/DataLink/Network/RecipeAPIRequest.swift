//
//  RecipeAPIRequest.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

enum RecipeAPIRequest {
    case getRecipes(parameters: RecipesParametersProtocol)
    case getRecipeDetails(id: String, parameters: RecipesParametersProtocol)
}


extension RecipeAPIRequest: APIRequestConfiguration {
    
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
        switch self {
        case .getRecipes:
            return "/api/recipes/v2"
        case .getRecipeDetails(let id, _):
            let path = "/api/recipes/v2/" + id
            return path
        }
    }

    // MARK: - Query Parameters
    
    var queryParameters: QueryParameters? {
        switch self {
        case .getRecipes(let parameters):
            return parameters.parameters
        case .getRecipeDetails(_ , let parameters):
            return parameters.parameters
        }
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

protocol RecipesParametersProtocol {
    var parameters: [String: String] { get }
}
