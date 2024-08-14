//
//  RecipeNetworkResponse.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

struct RecipesNetworkResponse: Codable {
    let from, to, count: Int?
    let hits: [RecipeHitNetowrkResponse]?
}

struct RecipeHitNetowrkResponse: Codable {
    let recipe: RecipeNetworkResponse?
}

struct RecipeNetworkResponse: Codable {
    let uri: String?
    let label: String?
    let image: String?
    let source: String?
}
