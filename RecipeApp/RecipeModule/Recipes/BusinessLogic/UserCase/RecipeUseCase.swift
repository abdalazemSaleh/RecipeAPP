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
}

extension RecipesUseCase {
    func getRecipes(with searchKey: String, and healthFilter: String) async throws -> [Recipe] {
        dataSource.isLoading = true

        var parameters = Constants.baseQueryItems
        parameters["q"] = searchKey
        if healthFilter != "Non" {
            parameters["healthFilter"] = healthFilter
        }
                
        guard let recipes = try await repository.getRecipes(RecipesParameters(parameters: parameters)) else {
            return []
        }
        dataSource.recipes = recipes.map { recipe in
            Recipe(
                uri: recipe.uri ?? "",
                label: recipe.label ?? "Not Founded",
                image: recipe.image ?? "",
                source: recipe.source ?? "Not Founded"
            )
        }
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
