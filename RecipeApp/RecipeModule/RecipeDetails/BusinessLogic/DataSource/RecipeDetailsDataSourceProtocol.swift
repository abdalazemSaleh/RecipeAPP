//
//  RecipeDetailsDataSourceProtocol.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation

protocol RecipeDetailsDataSourceProtocol {
    var recipeDetails: RecipeDetails? { get set }
    var isLoading: Bool { get set }
}
