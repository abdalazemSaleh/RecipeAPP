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
    private var count: Int = 0
    private(set) var nexPageId: String = ""
    
    private var searchKey: String = ""
    private var healthFilter: HealthFilter = .Non
    @Published var recipesArray: [RecipeViewItem] = []
    var searchKeyPassthroughSubject = PassthroughSubject<String, Never>()
    var healthFilterPassthroughSubject = PassthroughSubject<HealthFilter, Never>()
    var warningMessagePassthroughSubject = PassthroughSubject<String, Never>()
    var errorMessagePassthroughSubject = PassthroughSubject<String, Never>()
    @Published var isLoading: Bool = false
    
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
                guard let self = self else { return }
                self.searchKey = searchKey
                Task {
                    self.nexPageId = ""
                    self.recipesArray = []
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
                        self.nexPageId = ""
                        self.recipesArray = []
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
            if let recipe = try await useCase.getRecipes(with: searchKey, and: healthFilter.rawValue, pageID: nexPageId) {
                nexPageId = recipe.nextPageId
                let viewItem = recipe.hits.map { recipe in
                    RecipeViewItem(
                        uri: recipe.uri,
                        title: recipe.label,
                        image: recipe.image,
                        source: recipe.source
                    )
                }
                recipesArray.append(contentsOf: viewItem)
                print("Recipes array count is ", recipesArray.count)
            }  else {
                warningMessagePassthroughSubject.send("Faild to load data try agine later.")
            }
        } catch {
            errorMessagePassthroughSubject.send(error.localizedDescription)
            isLoading = false
        }
        isLoading = false
    }
}
