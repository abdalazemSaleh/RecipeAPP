//
//  RecipeDetails+CollectionViewExtentions.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import UIKit

extension RecipeDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func setUpCollectionView() {
        recipeDietLabelCollectionView.dataSource = self
        recipeDietLabelCollectionView.delegate = self
        recipeDietLabelCollectionView.register(
            UINib(
                nibName: LabelCollectionViewCell.identifire,
                bundle: nil
            ),
            forCellWithReuseIdentifier: LabelCollectionViewCell.identifire
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeDetailsViewModel.recipeLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.identifire, for: indexPath) as! LabelCollectionViewCell
        let label = recipeDetailsViewModel.recipeLabels[indexPath.row]
        cell.set(with: label)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 48
        let width = height * 2
        return CGSize(width: width, height: height)
    }

}
