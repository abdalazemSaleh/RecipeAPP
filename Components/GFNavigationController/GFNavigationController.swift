//
//  GFNavigationController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class GFNavigationController: UINavigationController {
    
    private var searchModuleFactory = SearchModuleFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    func setUpNavigationController() {
        if let searchViewController = searchModuleFactory.makeViewController() as? SearchViewController {
            self.viewControllers = [searchViewController]
        }
    }
}
