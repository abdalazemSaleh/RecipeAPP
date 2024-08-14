//
//  RecipeDetailsViewController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    // MARK: - PROPERTYS
    
    var id: String

    // MARK: - INIT
    
    init(id: String) {
        self.id = id
        print("Recipe id", id)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repositoryDependencies = RecipeRepositoryDependencies(
            client: RecipeAPIClient(client: BaseAPIClient())
        )
        let repository = RecipeRepository(dependencies: repositoryDependencies)
        let useCaseDependencies = RecipesDetailsUseCaseDependencies(
            dataSource: RecipeDetailsDataSource(),
            repository: repository
        )
        let useCase = RecipeDetailsUseCase(dependencie: useCaseDependencies)
        
        Task {
            do {
                let recipe = try await useCase.getRecipe(by: id)
                print("Recipe detaisls ", recipe)
            } catch {
                print("Error is ", error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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

//// MARK: -SearchViewModelDependenciesProtocol
//
//private struct SearchViewModelDependencies: SearchViewModelDependenciesProtocol {
//    var useCase: RecipesUseCaseProtocol
//}
//
//// MARK: - AccommodationViewDependenciesProtocol
//
//private struct SearchViewControllerDependencies: SearchViewControllerDependenciesProtocol {
//    var searchViewModel: SearchViewModel
//}
