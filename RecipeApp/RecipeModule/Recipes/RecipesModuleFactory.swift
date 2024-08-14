//
//  RecipesModuleFactory.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation
import UIKit

protocol SearchModuleFactoryProtocol {
    func makeViewController() -> UIViewController
}

final class SearchModuleFactory: SearchModuleFactoryProtocol {
    @MainActor
    func makeViewController() -> UIViewController {
        let repositoryDependencies = RecipeRepositoryDependencies(
            client: RecipeAPIClient(client: BaseAPIClient())
        )
        let repository = RecipeRepository(dependencies: repositoryDependencies)
        let useCaseDependencies = RecipesUseCaseDependencies(
            dataSource: RecipesDataSource(),
            repository: repository
        )
        let useCase = RecipesUseCase(dependencie: useCaseDependencies)
        let viewModelDependencies = SearchViewModelDependencies(useCase: useCase)
        let viewModel = SearchViewModel(dependencies: viewModelDependencies)
        let viewControllerDependencies = SearchViewControllerDependencies(searchViewModel: viewModel)
        let viewController = SearchViewController(dependencies: viewControllerDependencies)
        return viewController
    }
}

// MARK: - RecipeRepositoryDependencies

private struct RecipeRepositoryDependencies: RecipeRepositoryDependenciesProtocol {
    var client: RecipeAPIClientProtocol
}

// MARK: - RecipesUseCaseDependenciesProtocol

private struct RecipesUseCaseDependencies: RecipesUseCaseDependenciesProtocol {
    var dataSource: RecipesDataSourceProtocol
    var repository: RecipesRepositoryProtocol
}

// MARK: -SearchViewModelDependenciesProtocol

private struct SearchViewModelDependencies: SearchViewModelDependenciesProtocol {
    var useCase: RecipesUseCaseProtocol
}

// MARK: - SearchViewDependenciesProtocol

private struct SearchViewControllerDependencies: SearchViewControllerDependenciesProtocol {
    var searchViewModel: SearchViewModel
}
