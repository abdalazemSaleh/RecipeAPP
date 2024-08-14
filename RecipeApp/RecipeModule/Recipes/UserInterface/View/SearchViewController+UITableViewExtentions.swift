//
//  SearchViewController+UITableViewExtentions.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setUpTableView() {
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        recipesTableView.separatorStyle = .none
        recipesTableView.register(
            UINib(
                nibName: RecipeTableViewCell.identifire,
                bundle: nil
            ),
            forCellReuseIdentifier: RecipeTableViewCell.identifire
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchViewModel.recipesArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifire, for: indexPath) as! RecipeTableViewCell
        let recipe = searchViewModel.recipesArray[indexPath.section]
        cell.set(with: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = searchViewModel.recipesArray[indexPath.section]
        let vc = RecipeDetailsViewController(id: extractRecipeID(from: recipe.uri))
        vc.title = recipe.title
        navTo(vc)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func extractRecipeID(from url: String) -> String {
        let id = url.components(separatedBy: "recipe_")[1]
        return id
    }

}
