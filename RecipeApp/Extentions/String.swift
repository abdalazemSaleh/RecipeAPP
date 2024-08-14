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
    
    func extractUrl(using separator: String) -> String {
        let id = self.components(separatedBy: separator)[1]
        return id
    }
    
    var contParameter: String {
        guard let contRange = self.range(of: "_cont="),
              let typeRange = self.range(of: "&type") else {
            return ""
        }
        
        let contValue = self[contRange.upperBound..<typeRange.lowerBound]
        return String(contValue)
    }


}
