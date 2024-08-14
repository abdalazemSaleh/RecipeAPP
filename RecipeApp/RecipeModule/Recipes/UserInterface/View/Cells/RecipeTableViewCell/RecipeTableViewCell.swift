//
//  HealthFilterTableViewCell.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    // MARK: - PROPERTYS
    
    static let identifire = "RecipeTableViewCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet private var cellView: UIView!
    @IBOutlet private var recipeImage: CachedImageView!
    @IBOutlet private var recipeTitleLabel: UILabel!
    @IBOutlet private var recipeSourceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureCellView()
    }
    
    // MARK: - FUNCTIONS
    
    func set(with recipe: RecipeViewItem) {
        recipeImage.imageURL = recipe.image.asURL
        recipeTitleLabel.text = recipe.title
        recipeSourceLabel.text = recipe.source
    }
    
    private func configureCellView() {
        cellView.layer.cornerRadius = 8
        cellView.layer.masksToBounds = false
        
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cellView.layer.shadowOpacity = 0.1
        cellView.layer.shadowRadius = 2
        cellView.layer.shadowPath = UIBezierPath(roundedRect: cellView.bounds, cornerRadius: cellView.layer.cornerRadius).cgPath
        
        recipeImage.layer.cornerRadius = 16
        recipeImage.layer.masksToBounds = true
    }
}
