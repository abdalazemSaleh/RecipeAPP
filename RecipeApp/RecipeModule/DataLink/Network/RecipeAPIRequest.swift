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


/*
 
 label: "Vegetarian Pad See Ew",
 image: "Vegetarian Pad See Ew",
 calories: 1337.3201,
 totalWeight: 0.0,
 totalTime: 0.0,
 dietLabels: [],
 ingredientLines: [
 "3 cloves garlic, minced",
 "1 bunch Napa cabbage, Chinese broccoli,
 or bok choy, cleaned and sliced",
 "4 tablespoons safflower,
 canola, or vegetable oil",
 "6 ounces wide rice noodles",
 "2 lemon wedges",
 "2 eggs",
 "3-4 tablespoons black soy sauce (see introduction for details)",
 "1 teaspoon sugar",
 "1 dash fish sauce"
 ]
 */
