//
//  RecipeDetailsDataSource.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation

struct RecipeDetailsDataSource: RecipeDetailsDataSourceProtocol {
    var recipeDetails: RecipeDetails?
    var isLoading: Bool = true
}
