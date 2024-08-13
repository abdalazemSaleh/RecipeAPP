//
//  GFNavigationController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class GFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    func setUpNavigationController() {
        self.viewControllers = [SearchViewController()]
    }
}
