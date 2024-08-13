//
//  SearchViewController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let repositoryDependencies = RecipeRepositoryDependencies(
            client: RecipeAPIClient(client: BaseAPIClient())
        )
        let repository = RecipeRepository(dependencies: repositoryDependencies)

        
//        let parms = ParametersDep(parameters: [
//            "type": "public",
//            "app_id": "464be998",
//            "app_key": "a03fbeae4bf6fc4fd46a3f4d156cdd94",
//            "q": "c"
//        ])
//        
        let parms = ParametersDep(parameters: [
            "type": "public",
            "app_id": "464be998",
            "app_key": "a03fbeae4bf6fc4fd46a3f4d156cdd94",
        ])

        
//        Task {
//            do {
//                let res = try await repository.getRecipes(parms)
//                print("Res from repo is", res)
//            } catch {
//                print("Error is", error.localizedDescription)
//            }
//        }
        
        Task {
            do {
                let res = try await repository.getRecipeBy("48c06e46c8b520acb398abd233fa9299", parameters: parms)
                print("Res from repo is", res)
            } catch {
                print("Error is", error.localizedDescription)
            }
        }
    }

}


struct ParametersDep: RecipesParametersProtocol {
    var parameters: [String : String]
}


// MARK: - RecipeRepositoryDependencies

private struct RecipeRepositoryDependencies: RecipeRepositoryDependenciesProtocol {
    var client: RecipeAPIClientProtocol
}
