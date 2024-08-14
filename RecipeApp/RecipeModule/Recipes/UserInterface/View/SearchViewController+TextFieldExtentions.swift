//
//  SearchViewController+TextFieldExtentions.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

extension SearchViewController: UITextFieldDelegate {
    
    func setUpTextField() {
        searchTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        performSearch()
        textField.resignFirstResponder()
        return true
    }
    
    private func performSearch() {
        guard let searchKey = searchTextField.text, !searchKey.isEmpty else {
            return
        }
        
        Task {
            activeIndicator.startAnimating()
            recipesTableView.isHidden = true
            emptyStateView.isHidden = true
            await searchViewModel.searchForRecipe(by: searchKey)
        }
    }
}
