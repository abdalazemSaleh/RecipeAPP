//
//  RecipesDataSource.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

struct RecipesDataSource: RecipesDataSourceProtocol {
    var recipes: [Recipe] = []
    var isLoading: Bool = true
}
