//
//  UIViewController.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

extension UIViewController {
        
    func showAlert(ofType type: AlertType, message: String, buttonTitle: String, completion: (() -> Void)? = nil) {
        switch type {
        case .warning:
            showWarningAlert(
                message: message,
                buttonTitle: buttonTitle,
                completion: completion
            )
        case .error:
            showErrorAlert(
                message: message,
                buttonTitle: buttonTitle,
                completion: completion
            )
        }
    }
}

extension UIViewController {
    fileprivate func showWarningAlert(message: String, buttonTitle: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(
            title: "Warning",
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func showErrorAlert(message: String, buttonTitle: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    enum AlertType {
        case warning
        case error
    }
}

extension UIViewController {
    func navTo(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: false)
    }
}
