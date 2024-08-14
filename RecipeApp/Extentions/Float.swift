//
//  Float.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation

extension Float {
    func toTimeFormat() -> String {
        let hours = Int(self)
        let minutes = Int((self - Float(hours)) * 60)
        return "\(hours)h \(minutes)m"
    }
    
    func toWeightFormat() -> String {
        if self >= 1.0 {
            return "\(self)kg"
        } else {
            let grams = self * 1000
            return "\(Int(grams))g"
        }
    }
    
    func toCaloriesFormat() -> String {
        if self >= 1000.0 {
            let kiloCalories = self / 1000.0
            return "\(String(format: "%.1f", kiloCalories))k cal"
        } else {
            return "\(Int(self)) cal"
        }
    }
}
