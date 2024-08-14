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
        
    @Published var isLoading: Bool = false
    @Published var recipesArray: [RecipeViewItem] = []
    var errorMessagePassthroughSubject = PassthroughSubject<String, Never>()
    var warningMessagePassthroughSubject = PassthroughSubject<String, Never>()
    var searchKeyPassthroughSubject = PassthroughSubject<String, Never>()
    var healthFilterPassthroughSubject = PassthroughSubject<HealthFilter, Never>()
    
    private var searchKey: String = ""
    private var healthFilter: HealthFilter = .Non
    
    private let useCase: RecipesUseCaseProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - INIT
    
    init(dependencies: SearchViewModelDependenciesProtocol) {
        self.useCase = dependencies.useCase
        setupBindings()
    }
    
    private func setupBindings() {
        
        // searchKey
        
        searchKeyPassthroughSubject
            .sink { [weak self] searchKey in
                print("i come from search key subkjec")
                guard let self = self else { return }
                self.searchKey = searchKey
                Task {
                    await self.searchForRecipe()
                }
            }
            .store(in: &cancellables)
        
        // healthFilter
        
        healthFilterPassthroughSubject
            .sink { [weak self] healthFilter in
                guard let self = self else { return }
                if searchKey.isEmpty {
                    warningMessagePassthroughSubject.send("Please search for specific recipe first")
                    self.healthFilter = healthFilter
                } else {
                    self.healthFilter = healthFilter
                    Task {
                        await self.searchForRecipe()
                    }
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Search ViewModelProtocol

extension SearchViewModel: SearchViewModelProrocol {
    func searchForRecipe() async {
        isLoading = true
        do {
            let recipes = try await useCase.getRecipes(with: searchKey, and: healthFilter.rawValue)
            let viewItems = recipes.map { recipe in
                RecipeViewItem(
                    uri: recipe.uri,
                    title: recipe.label,
                    image: recipe.image,
                    source: recipe.source
                )
            }
            recipesArray = viewItems
        } catch {
            errorMessagePassthroughSubject.send(error.localizedDescription)
            isLoading = false
        }
        isLoading = false
    }
}
