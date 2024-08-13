//
//  RecipesDataSourceProtocol.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

protocol RecipesDataSourceProtocol {
    var recipes: [Recipe] { get set }
    var isLoading: Bool { get set }
}
