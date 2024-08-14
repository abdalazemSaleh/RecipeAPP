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
        guard let searchKey = searchTextField.text, !searchKey.isEmpty else {
            return false
        }
        searchViewModel.searchKeyPassthroughSubject.send(searchKey)
        textField.resignFirstResponder()
        return true
    }    
}
