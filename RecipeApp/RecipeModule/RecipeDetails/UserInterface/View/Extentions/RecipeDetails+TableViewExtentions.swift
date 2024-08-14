//
//  RecipeDetails+TableViewExtentions.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

extension RecipeDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setUpTableView() {
        recipeIngredientTableView.dataSource = self
        recipeIngredientTableView.delegate = self
        recipeIngredientTableView.register(UITableViewCell.self, forCellReuseIdentifier: "IngredientCell")
        recipeIngredientTableView.reloadData()
        tableViewHeightConstraint = recipeIngredientTableView.heightAnchor.constraint(equalToConstant: 0)
        tableViewHeightConstraint.isActive = true
    }
    
    func updateTableViewHeight() {
        recipeIngredientTableView.layoutIfNeeded()
        let contentHeight = recipeIngredientTableView.contentSize.height
        tableViewHeightConstraint.constant = contentHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        cell.textLabel?.text = "Ingredient \(indexPath.row + 1)"
        return cell
    }

}
