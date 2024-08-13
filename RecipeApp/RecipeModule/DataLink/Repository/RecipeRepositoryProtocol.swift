//
//  RecipeRepositoryProtocol.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

protocol RecipesRepositoryProtocol: RecipesRepositoryGettable { }

protocol RecipesRepositoryGettable {
    func getRecipes(_ parameters: RecipesParametersProtocol) async throws -> [RecipeRepositoryResponseProtocol]?
    func getRecipeBy(_ id: String, parameters: RecipesParametersProtocol) async throws -> RecipeDetailsRepositoryResponseProtocol?
}

// MARK: - AccommodationsRepositoryResponseProtocols

protocol RecipeRepositoryResponseProtocol {
    var label: String? { get }
    var image: String? { get }
    var source: String? { get }
}

struct RecipeRepositoryResponse: RecipeRepositoryResponseProtocol {
    var label: String?
    var image: String?
    var source: String?
}

// MARK: - AccommodationsDetailsResponseProtocol

protocol RecipeDetailsRepositoryResponseProtocol {
    var label: String? { get }
    var image: String? { get }
    var calories: Float? { get }
    var totalWeight: Float? { get }
    var totalTime: Float? { get }
    var dietLabels: [String]? { get }
    var ingredientLines: [String]? { get }
}


struct RecipeRepositoryDetailsResponse: RecipeDetailsRepositoryResponseProtocol {
    var label: String?
    var image: String?
    var calories: Float?
    var totalWeight: Float?
    var totalTime: Float?
    var dietLabels: [String]?
    var ingredientLines: [String]?
}

