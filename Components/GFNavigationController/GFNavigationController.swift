//
//  GFNavigationController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class GFNavigationController: UINavigationController {
    
        private var searchModuleFactory = SearchModuleFactory()
//    private var searchModuleFactory = RecipeDetailsModuleFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    func setUpNavigationController() {
                if let searchViewController = searchModuleFactory.makeViewController() as? SearchViewController {
                    self.viewControllers = [searchViewController]
                }
//        if let searchViewController = searchModuleFactory.makeViewController(with: "d28d7c2a7f7e368a13dec37e43d8c32d") as? RecipeDetailsViewController {
//            self.viewControllers = [searchViewController]
//        }
    }
}
