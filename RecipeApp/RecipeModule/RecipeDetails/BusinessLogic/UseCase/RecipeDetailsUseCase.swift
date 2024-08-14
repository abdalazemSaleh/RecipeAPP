//
//  RecipeDetailsUseCase.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation

protocol RecipeDetailsUseCaseDependenciesProtocol {
    var dataSource: RecipeDetailsDataSourceProtocol { get }
    var repository: RecipesRepositoryProtocol { get }
}

final class RecipeDetailsUseCase: RecipeDetailsUseCaseProtocol {
    
    // MARK: - Propertys
    
    private var dataSource: RecipeDetailsDataSourceProtocol
    private var repository: RecipesRepositoryProtocol

    // MARK: - Init
    
    init(dependencie: RecipeDetailsUseCaseDependenciesProtocol) {
        self.dataSource = dependencie.dataSource
        self.repository = dependencie.repository
    }
    
    private func convert(_ response: RecipeRepositoryDetailsResponse) -> RecipeDetails {
        return RecipeDetails(
            label: response.label ?? "Not Founded",
            image: response.label ?? "",
            calories: response.calories ?? 0.0,
            totalWeight: response.totalWeight ?? 0.0,
            totalTime: response.totalTime ?? 0.0,
            dietLabels: response.dietLabels ?? [],
            ingredientLines: response.ingredientLines ?? []
        )
    }
}


extension RecipeDetailsUseCase {
    func getRecipe(by id: String) async throws -> RecipeDetails {
        dataSource.isLoading = true
        
        let parameters = Constants.baseQueryItems
        
        guard let recipeDetailsResponse = try await repository.getRecipeBy(id, parameters: RecipeDetailsParameters(parameters: parameters)) else {        
            dataSource.isLoading = false
            throw RepositoryError.unowned
        }
        
        dataSource.recipeDetails = convert(recipeDetailsResponse as! RecipeRepositoryDetailsResponse)
        dataSource.isLoading = false

        if let recipeDetails = dataSource.recipeDetails {
            return recipeDetails
        } else {
            throw RepositoryError.noData
        }
    }
    
    func notifyLoading() -> Bool {
        dataSource.isLoading
    }
    
    func stopLoading() -> Bool {
        dataSource.isLoading
    }
}

struct RecipeDetailsParameters: RecipesParametersProtocol {
    var parameters: [String : String]
}
