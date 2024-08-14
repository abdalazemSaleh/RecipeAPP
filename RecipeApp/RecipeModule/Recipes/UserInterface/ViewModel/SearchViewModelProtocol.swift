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

//protocol SearchViewModelProrocol {
//    var isLoading: CurrentValueSubject<Bool, Never> { get set }
//    var errorMessage: CurrentValueSubject<String, Never> { get set }
//    var searchKey: CurrentValueSubject<String, Never> { get set }
//    var healthFilter: CurrentValueSubject<HealthFilter, Never> { get set }
//    var recipesArray: CurrentValueSubject<[RecipeViewItem], Never> { get set }
//    func getRecipes() async
//}

protocol SearchViewModelProrocol {
    var isLoading: Bool { get set }
    var errorMessage: String { get set }
    var healthFilter: HealthFilter { get set }
    var recipesArray: [RecipeViewItem]{ get set }
    func searchForRecipe(by searchKey: String) async
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
