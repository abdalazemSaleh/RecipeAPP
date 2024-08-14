//
//  RecipeUseCase.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

protocol RecipesUseCaseDependenciesProtocol {
    var dataSource: RecipesDataSourceProtocol { get }
    var repository: RecipesRepositoryProtocol { get }
}

final class RecipesUseCase: RecipesUseCaseProtocol {
    
    // MARK: - Propertys
    
    private var dataSource: RecipesDataSourceProtocol
    private var repository: RecipesRepositoryProtocol

    // MARK: - Init
    
    init(dependencie: RecipesUseCaseDependenciesProtocol) {
        self.dataSource = dependencie.dataSource
        self.repository = dependencie.repository
    }
    
    // MARK: - FUNCTIONS
    
    private func convert(_ recipeResponse: RecipeRepositoryResponseProtocol) -> Recipe {
        Recipe(
            count: recipeResponse.count ?? 0,
            nextPageId: recipeResponse.nextPageId?.contParameter ?? "",
            hits: recipeResponse.hits?.compactMap { recipe in
                RecipeModel(
                    uri: recipe.uri ?? "",
                    label: recipe.label ?? "Not Founded",
                    image: recipe.image ?? "",
                    source: recipe.source ?? "Not Founded"
                )
            } ?? []
        )
    }
    
}

extension RecipesUseCase {
    func getRecipes(with searchKey: String, and healthFilter: String, pageID: String) async throws -> Recipe? {
        dataSource.isLoading = true

        var parameters = Constants.baseQueryItems
        parameters["q"] = searchKey
        if healthFilter != "Non" {
            parameters["healthFilter"] = healthFilter
        }
        if !pageID.isEmpty {
            parameters["_cont"] = pageID
        }
                
        print(parameters)
        
        guard let recipeResponse = try await repository.getRecipes(RecipesParameters(parameters: parameters)) else {
            throw RepositoryError.noData
        }
        dataSource.recipes = convert(recipeResponse)
        dataSource.isLoading = false
        return dataSource.recipes
    }
    
    func notifyLoading() -> Bool {
        dataSource.isLoading
    }
    
    func stopLoading() -> Bool {
        dataSource.isLoading
    }
}


struct RecipesParameters: RecipesParametersProtocol {
    var parameters: [String : String]
}
