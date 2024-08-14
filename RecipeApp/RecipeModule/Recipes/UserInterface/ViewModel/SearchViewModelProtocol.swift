//
//  SearchViewModelProtocol.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation
import Combine

enum HealthFilter: String, CaseIterable {
    case Non
    case LowSugar
    case DairyFree
    case Vegan
}

protocol SearchViewModelProrocol {
    var isLoading: Bool { get set }
    var errorMessagePassthroughSubject: PassthroughSubject<String, Never> { get set }
    var warningMessagePassthroughSubject: PassthroughSubject<String, Never> { get set}
    var searchKeyPassthroughSubject: PassthroughSubject<String, Never> { get set }
    var healthFilterPassthroughSubject: PassthroughSubject<HealthFilter, Never> { get set }
    var recipesArray: [RecipeViewItem]{ get set }
    func searchForRecipe() async
}


struct RecipeViewItem {
    var title: String
    var image: String
    var source: String
}

extension RecipeViewItem {
    static let mockData: [RecipeViewItem] = [
        RecipeViewItem(
            title: "Recipe 1",
            image: "",
            source: "Resturant 1"
        ),
        RecipeViewItem(
            title: "Recipe 2",
            image: "",
            source: "Resturant 2"
        ),
        RecipeViewItem(
            title: "Recipe 3",
            image: "",
            source: "Resturant 3"
        ),
        RecipeViewItem(
            title: "Recipe 4",
            image: "",
            source: "Resturant 4"
        )
    ]
}
