//
//  HealthFilterCollectionViewCell.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import UIKit

class HealthFilterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - PROPERTYS
    
    static let identifire = "HealthFilterCollectionViewCell"
        
    // MARK: - IBOutlet
    
    @IBOutlet var cellView: UIView!
    @IBOutlet var titlteLabel: UILabel!

    // MARK: - FUNCTIONS
    
    func set(with title: String) {
        self.titlteLabel.text = title
    }
    
    func updateAppearance(isSelected: Bool) {
        cellView.backgroundColor = isSelected ? Colors.secoundryBG : Colors.secoundry
        titlteLabel.textColor = isSelected ? .white : Colors.text
    }
}
