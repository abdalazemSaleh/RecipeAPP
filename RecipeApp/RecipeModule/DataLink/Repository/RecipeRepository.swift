//
//  RecipeRepository.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation


protocol RecipeRepositoryDependenciesProtocol {
    var client: RecipeAPIClientProtocol { get }
}

final class RecipeRepository: RecipesRepositoryProtocol {
    
    init(dependencies: RecipeRepositoryDependenciesProtocol) {
        self.client = dependencies.client
    }
    
    // MARK:  Privates
    
    private let client: RecipeAPIClientProtocol
        
}

// MARK: - Get Recipes List

extension RecipeRepository {
    func getRecipes(_ parameters: any RecipesParametersProtocol) async throws -> [RecipeRepositoryResponseProtocol]? {
        var recipes: [RecipeRepositoryResponseProtocol]?
        do {
            recipes = try await client.getRecipes(with: parameters)?.hits?.compactMap { recipe in
                RecipeRepositoryResponse(
                    uri: recipe.recipe?.uri,
                    label: recipe.recipe?.label,
                    image: recipe.recipe?.image,
                    source: recipe.recipe?.source
                )
            }
        }
        return recipes
    }
}

// MARK: - Get Recipes Details

extension RecipeRepository {
    func getRecipeBy(_ id: String, parameters: any RecipesParametersProtocol) async throws -> RecipeDetailsRepositoryResponseProtocol? {
        var recipeDetails: RecipeDetailsRepositoryResponseProtocol?
        do {
            recipeDetails = try await client.getRecipe(by: id, parameters: parameters).map { recipe in
                RecipeRepositoryDetailsResponse(
                    label: recipe.recipe.label,
                    image: recipe.recipe.image,
                    calories: recipe.recipe.calories,
                    totalWeight: recipe.recipe.totalTime,
                    totalTime: recipe.recipe.totalTime,
                    dietLabels: recipe.recipe.dietLabels,
                    ingredientLines: recipe.recipe.ingredientLines
                )
            }
        }
        return recipeDetails
    }
}
