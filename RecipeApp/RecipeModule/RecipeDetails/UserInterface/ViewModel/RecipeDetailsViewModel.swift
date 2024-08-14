//
//  RecipeDetailsViewModel.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation
import Combine

protocol RecipeDetailsViewModelProrocol {
    var recipeId: String { get }
    var recipeDetailsViewItem: PassthroughSubject<RecipeDetailsViewItem, Never> { get set }
    var errorMessagePassthroughSubject: PassthroughSubject<String, Never> { get set }
    var recipeLabels: [String] { get set }
    var recipeIngredient: [String] { get set }
    var isLoading: Bool { get set }
    func getRecipe() async
}

struct RecipeDetailsViewItem {
    var label: String
    var image: String
    var calories: String
    var totalWeight: String
    var totalTime: String
    var dietLabels: [String]
    var ingredientLines: [String]
}

extension RecipeDetailsViewItem {
    static let mockData: RecipeDetailsViewItem =  RecipeDetailsViewItem(
        label: "Recipe 1",
        image: "",
        calories: "123.5",
        totalWeight: "200.0",
        totalTime: "1.6",
        dietLabels: [
            "Label_1",
            "Label_2"
        ],
        ingredientLines: [
            "1 bunch Napa cabbage, Chinese broccoli, or bok choy, cleaned and sliced",
            "4 tablespoons safflower, canola, or vegetable oil",
            "6 ounces wide rice noodles"
        ]
    )
}
