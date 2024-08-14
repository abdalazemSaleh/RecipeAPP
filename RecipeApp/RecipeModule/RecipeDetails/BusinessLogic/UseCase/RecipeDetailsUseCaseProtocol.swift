//
//  RecipeDetailsUseCaseProtocol.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation

protocol  RecipeDetailsUseCaseProtocol {
    func getRecipe(by id: String) async throws -> RecipeDetails
    func notifyLoading() -> Bool
    func stopLoading() -> Bool
}

struct RecipeDetails {
    var label: String
    var image: String
    var calories: String
    var totalWeight: String
    var totalTime: String
    var dietLabels: [String]
    var ingredientLines: [String]
}
