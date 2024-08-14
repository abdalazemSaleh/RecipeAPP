//
//  LabelCollectionViewCell.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {

    // MARK: - PROPERTYS
    
    static let identifire = "LabelCollectionViewCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var recipeLabel: UILabel!

    // MARK: - FUNCTIONS
    
    func set(with label: String) {
        recipeLabel.text = label
        containerView.backgroundColor = getRandomColorWithOpacity(0.3)
    }

    private func getRandomColorWithOpacity(_ opacity: CGFloat) -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: opacity)
    }
}
