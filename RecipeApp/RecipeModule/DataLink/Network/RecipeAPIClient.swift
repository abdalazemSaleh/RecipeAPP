//
//  RecipeAPIClient.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

protocol RecipeAPIClientProtocol {
    func getRecipes(with parameters: RecipesParametersProtocol) async throws -> RecipesNetworkResponse?
    func getRecipe(by id: String, parameters: RecipesParametersProtocol) async throws -> RecipeDetailsNetworkResponse?
}

final class RecipeAPIClient: RecipeAPIClientProtocol {
    
    let client: BaseAPIClientProtocol
    
    init(client: BaseAPIClientProtocol) {
        self.client = client
    }

}

// MARK: - Get Recipes List

extension RecipeAPIClient {
    func getRecipes(with parameters: RecipesParametersProtocol) async throws -> RecipesNetworkResponse? {
        let request = RecipeAPIRequest.getRecipes(parameters: parameters)
        var recipes: RecipesNetworkResponse?
        recipes = try await client.perform(request)
        return recipes
    }
}

// MARK: - Get Recipe Details

extension RecipeAPIClient {
    func getRecipe(by id: String, parameters: RecipesParametersProtocol) async throws -> RecipeDetailsNetworkResponse? {
        let request = RecipeAPIRequest.getRecipeDetails(id: id, parameters: parameters)
        var recipeDetails: RecipeDetailsNetworkResponse?
        recipeDetails = try await client.perform(request)
        return recipeDetails
    }
}
