//
//  String.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 14/08/2024.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
