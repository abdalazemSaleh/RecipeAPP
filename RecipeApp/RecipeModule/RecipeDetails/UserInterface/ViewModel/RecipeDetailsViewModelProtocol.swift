//
//  RecipeDetailsViewModelProtocol.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation
import Combine

protocol RecipeDetailsViewModelDependenciesProtocol {
    var useCase: RecipeDetailsUseCaseProtocol { get }
}

final class RecipeDetailsViewModel {
    
    // MARK: - PROPERTYS
    
    var recipeId: String
    var recipeDetailsViewItem = PassthroughSubject<RecipeDetailsViewItem, Never>()
    var recipeLabels: [String] = []
    var recipeIngredient: [String] = []
    var errorMessagePassthroughSubject = PassthroughSubject<String, Never>()
    @Published var isLoading: Bool = false
            
    private let useCase: RecipeDetailsUseCaseProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - INIT
    
    init(dependencies: RecipeDetailsViewModelDependenciesProtocol, recipeId: String) {
        self.useCase = dependencies.useCase
        self.recipeId = recipeId
        Task {
            await getRecipe()
        }
    }
        
    private func convert(recipeDetails: RecipeDetails) -> RecipeDetailsViewItem {
        RecipeDetailsViewItem(
            label: recipeDetails.label,
            image: recipeDetails.image,
            calories: recipeDetails.calories,
            totalWeight: recipeDetails.totalWeight,
            totalTime: recipeDetails.totalTime,
            dietLabels: recipeDetails.dietLabels,
            ingredientLines: recipeDetails.ingredientLines
        )
    }
}

// MARK: - RecipeDetails ViewModelProtocol

extension RecipeDetailsViewModel: RecipeDetailsViewModelProrocol {
    func getRecipe() async {
        isLoading = true
        do {
            let recipeDetails = try await useCase.getRecipe(by: recipeId)
            recipeLabels = recipeDetails.dietLabels
            recipeIngredient = recipeDetails.ingredientLines
            recipeDetailsViewItem.send(convert(recipeDetails: recipeDetails))
        } catch {
            errorMessagePassthroughSubject.send(error.localizedDescription)
            isLoading = false
        }
        isLoading = false
    }
}
