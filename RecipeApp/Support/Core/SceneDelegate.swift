//
//  SceneDelegate.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window                      = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        
        window?.rootViewController = GFNavigationController()
        
        window?.makeKeyAndVisible()
    }
    
}
