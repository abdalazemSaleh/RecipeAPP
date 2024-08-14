//
//  RecipeDetailsModuleFactory.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

protocol RecipeDetailsModuleFactoryProtocol {
    func makeViewController(with id: String) -> UIViewController
}

final class RecipeDetailsModuleFactory: RecipeDetailsModuleFactoryProtocol {
    @MainActor
    func makeViewController(with id: String) -> UIViewController {
        let repositoryDependencies = RecipeRepositoryDependencies(
            client: RecipeAPIClient(client: BaseAPIClient())
        )
        let repository = RecipeRepository(dependencies: repositoryDependencies)
        let useCaseDependencies = RecipesDetailsUseCaseDependencies(
            dataSource: RecipeDetailsDataSource(),
            repository: repository
        )
        let useCase = RecipeDetailsUseCase(dependencie: useCaseDependencies)
        let viewModelDependencies = RecipeDetailsViewModelDependencies(useCase: useCase)
        let viewModel = RecipeDetailsViewModel(dependencies: viewModelDependencies, recipeId: id)
        let viewControllerDependencies = RecipeDetailsViewControllerDependencies(recipeDetailsViewModel: viewModel)
        let viewController = RecipeDetailsViewController(dependencies: viewControllerDependencies)
        return viewController
    }
}

// MARK: - RecipeRepositoryDependencies

private struct RecipeRepositoryDependencies: RecipeRepositoryDependenciesProtocol {
    var client: RecipeAPIClientProtocol
}

// MARK: - RecipesUseCaseDependenciesProtocol

private struct RecipesDetailsUseCaseDependencies: RecipeDetailsUseCaseDependenciesProtocol {
    var dataSource: RecipeDetailsDataSourceProtocol
    var repository: RecipesRepositoryProtocol
}

// MARK: -SearchViewModelDependenciesProtocol

private struct RecipeDetailsViewModelDependencies: RecipeDetailsViewModelDependenciesProtocol {
    var useCase: RecipeDetailsUseCaseProtocol
}

// MARK: - RecipeDetailsViewDependenciesProtocol

private struct RecipeDetailsViewControllerDependencies: RecipeDetailsViewControllerDependenciesProtocol {
    var recipeDetailsViewModel: RecipeDetailsViewModel
}
