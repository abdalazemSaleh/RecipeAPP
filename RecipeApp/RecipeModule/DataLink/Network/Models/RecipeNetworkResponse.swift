//
//  RecipeNetworkResponse.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

struct RecipesNetworkResponse: Codable {
    let from, to, count: Int?
    let links: Links?
    let hits: [RecipeHitNetowrkResponse]?
    
    enum CodingKeys: String, CodingKey {
        case from, to, count, hits
        case links = "_links"
    }
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

struct Links: Codable {
    let next: Next?
}

struct Next: Codable {
    let href: String?
}
