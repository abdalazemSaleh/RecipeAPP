//
//  SearchViewController+CollectionViewExtentions.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HealthFilter.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HealthFilterCollectionViewCell.identifire, for: indexPath) as! HealthFilterCollectionViewCell
        let title = HealthFilter.allCases[indexPath.row]
        cell.set(with: title.rawValue)
        
        let isSelected = (indexPath == selectedIndexPath)
        cell.updateAppearance(isSelected: isSelected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndexPath = selectedIndexPath {
            let previousCell = collectionView.cellForItem(at: previousIndexPath) as? HealthFilterCollectionViewCell
            previousCell?.updateAppearance(isSelected: false)
        }
        
        selectedIndexPath = indexPath
        let cell = collectionView.cellForItem(at: indexPath) as? HealthFilterCollectionViewCell
        cell?.updateAppearance(isSelected: true)
    }
}
