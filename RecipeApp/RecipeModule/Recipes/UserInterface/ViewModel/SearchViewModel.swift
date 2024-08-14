//
//  SearchViewModel.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation
import Combine

protocol SearchViewModelDependenciesProtocol {
    var useCase: RecipesUseCaseProtocol { get }
}

final class SearchViewModel {
    
    // MARK: - PROPERTYS
    
    //    var isLoading = CurrentValueSubject<Bool, Never>(true)
    //    var errorMessage = CurrentValueSubject<String, Never>("")
    //    var searchKey = CurrentValueSubject<String, Never>("ch")
    //    var healthFilter = CurrentValueSubject<HealthFilter, Never>(.DairyFree)
    //    var recipesArray = CurrentValueSubject<[RecipeViewItem], Never>([])
    
    @Published var isLoading: Bool = true
    @Published var errorMessage: String = ""
    @Published var healthFilter: HealthFilter = .DairyFree
    @Published var recipesArray: [RecipeViewItem] = []
    
    private let useCase: RecipesUseCaseProtocol
    
    // MARK: - INIT
    
    init(dependencies: SearchViewModelDependenciesProtocol) {
        self.useCase = dependencies.useCase
    }
    
}

// MARK: - Search ViewModelProtocol

extension SearchViewModel: SearchViewModelProrocol {
    func searchForRecipe(by searchKey: String) async {
        //        isLoading.send(true)
        do {
            //            print("Search key is ", searchKey.value)
            let recipes = try await useCase.getRecipes(with: searchKey, and: healthFilter.rawValue)
            let viewItems = recipes.map { recipe in
                RecipeViewItem(
                    title: recipe.label,
                    image: recipe.image,
                    source: recipe.source
                )
            }
            recipesArray = viewItems
            //            recipesArray.send(viewItems)
        } catch {
            //            errorMessage.send(error.localizedDescription)
            //            isLoading.send(true)
        }
        //        isLoading.send(false)
    }
}
