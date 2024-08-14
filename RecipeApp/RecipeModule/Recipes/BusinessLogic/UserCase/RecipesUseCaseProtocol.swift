//
//  RecipesUseCaseProtocol.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

protocol RecipesUseCaseProtocol {
    func getRecipes(with searchKey: String, and healthFilter: String) async throws -> [Recipe]
    func notifyLoading() -> Bool
    func stopLoading() -> Bool
}


struct Recipe {
    var uri: String
    var label: String
    var image: String
    var source: String
}
