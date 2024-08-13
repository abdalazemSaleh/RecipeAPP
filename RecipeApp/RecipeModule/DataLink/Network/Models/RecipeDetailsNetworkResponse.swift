//
//  RecipeDetailsNetworkResponse.swift
//  RecipeApp
//
//  Created by Abdalazem Saleh on 13/08/2024.
//

import Foundation

struct RecipeDetailsNetworkResponse: Codable {
    let recipe: RecipeDetailsResponse
}

struct RecipeDetailsResponse: Codable {
    let label, image: String?
    let calories, totalWeight, totalTime: Float?
    let dietLabels, ingredientLines: [String]?
}

/*
 {
     "recipe": {
         "label": "Vitamin C Drink",
         "image": "https://edamam-product-images.s3.amazonaws.com/web-img/54a/54abb5ddccc6b7046a6d2478e048dede?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEK7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCw%2BOZXoYsEh5mAWs%2F3VYXJ5A5Xjw1RJVfwpldVd0CWKQIhAPkxuSUnaYUIaT5KmcnpTGlLUhvuWnFwyaVGqbsW%2BjuAKsEFCKf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2Igygs70TDQXlToZ3SnoqlQUvDo1aqep7OEt1GxJJffqOutZNf1bFAcZPMTkz4nkcGK0AAtgUJ48qFATKVfpGTOYo3Vn9NzKWu5fpRi21%2BpkXoifgTdaFGas62j2vORE1AiuVV5KQNeRjxAsLP5UNUP4LPoCIZsaYVbUu5sDMSuCpUm19mvKcXhyYFYdlL0sdmEpfzQwt%2FK6RXEkugDTMbdJaCGwrgH9q7BLnil4BIpSGT1k%2FtC42uF0hKVsMhNXbQgJ3drVNw%2FHYm2Oi16LJrhhzCp4OGOTkZIt3NJUfpZyRnhRw94PQ0IGMEBSnL5ofIPnAlYZQ8Rvc5bKlR7zKfZmZrnp67l1hOq5TzVULAmtyooNKv6q81wnUr%2B7x8mNFHBbiFeO%2FrlupKazn%2FY8oYQq%2FU55rQHzde2LLcKQcZem8W2q1QXzK%2BZ5Jhgj%2BZ4YFduBo3o9Z9Km%2F0IgDVSyippnFo2XZHXvOoeRz3F2lrkzdaWAcGzNhB0Aw9R8BjJYVczrZj9y2rL8hsCPudrHmxRz2J1aKq0tm9V0%2FZoyqAh2l0hHbPU3jgL6jcx8vRXVoWPdpVMwJDAi7QFXS2AuUFibtGbqx32Rz3Fz6N3lBHmFeKrPry4nxbN%2FHREXe6Y5njy%2BYLOuhAqmMKT%2FmrDXYmJAUAZigp6Vhn1H0mX8XSnHT%2BV1MGdTlYYiTuCqTwWcnDDg0qkSOaVWRXZnALiywUwAQwZxaM%2BFXzTZl6h3VKfIOLlCeQXyR7u%2Ba5xOUFy6lcGT5bIypsq7NYJyDZnxsCx3A4%2BqRA2E84xyhliRjx4GzqdHN5TeP3p2u%2F%2FYDQESj5pNh%2BMChToebrMY2XaxNHHjJlZXnztnR1RaeWMgQyFY%2BaFVkImZRgMLnc8q6SVPqgy1dfdnGMK7I7bUGOrABOO00RaalfuGKXDJ1PT0M4%2BUkJbLDQVOC3mD2I4zJqVTAljC9jbtH7kvGHjV%2BRDz8wXy7b8%2FRChVnOFnoUupJYigvqqWUbwpGxO1dCoHz4zeRIcGtTZThLMDiYSxDvCogVJAQ9Ixh0QoNSbPL7O6OT%2BOgsWjSieTCHneDFyvvIyOgW0DoPkyzqB5gzzgfVgEQzVZrN5Lsu%2B7lUCU6GrvrQ7ZpVfADm8ia1XbXS72QZFY%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240813T144002Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFO76NFLRU%2F20240813%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=dcf63fd6df5075824c4ec5f1e0c92171a6ba589fcf1ab1e67c5d224f3024cb61",
         "dietLabels": [
             "High-Fiber",
             "Low-Fat",
             "Low-Sodium"
         ],
         "ingredientLines": [
             "12 ounces fresh strawberries, hulled",
             "1 1/2 cups freshly squeezed orange juice",
             "1 cup blueberries",
             "1 ripe banana",
             "1/4 cup freshly squeezed lemon juice"
         ],
         "ingredients": [
             {
                 "text": "12 ounces fresh strawberries, hulled",
                 "quantity": 12.0,
                 "measure": "ounce",
                 "food": "strawberries",
                 "weight": 340.1942775,
                 "foodCategory": "fruit",
                 "foodId": "food_b4s2ibkbrrucmbabbaxhfau8ay42",
                 "image": "https://www.edamam.com/food-img/00c/00c8851e401bf7975be7f73499b4b573.jpg"
             },
             {
                 "text": "1 1/2 cups freshly squeezed orange juice",
                 "quantity": 1.5,
                 "measure": "cup",
                 "food": "freshly squeezed orange juice",
                 "weight": 372.0,
                 "foodCategory": "100% juice",
                 "foodId": "food_bn7zicravp7kdrb8h9knhadt6kei",
                 "image": "https://www.edamam.com/food-img/011/011c0c3b0f3865bde575f57c556439e4.jpg"
             },
             {
                 "text": "1 cup blueberries",
                 "quantity": 1.0,
                 "measure": "cup",
                 "food": "blueberries",
                 "weight": 148.0,
                 "foodCategory": "fruit",
                 "foodId": "food_bgkl0cuasoeomtbolalmcauhha54",
                 "image": "https://www.edamam.com/food-img/f55/f55705a2a9ea9f7abf449a05fa968139.png"
             },
             {
                 "text": "1 ripe banana",
                 "quantity": 1.0,
                 "measure": "<unit>",
                 "food": "banana",
                 "weight": 115.7,
                 "foodCategory": "fruit",
                 "foodId": "food_bjsfxtcaidvmhaa3afrbna43q3hu",
                 "image": "https://www.edamam.com/food-img/9f6/9f6181163a25c96022ee3fc66d9ebb11.jpg"
             },
             {
                 "text": "1/4 cup freshly squeezed lemon juice",
                 "quantity": 0.25,
                 "measure": "cup",
                 "food": "lemon juice",
                 "weight": 61.0,
                 "foodCategory": "100% juice",
                 "foodId": "food_bglm6vxahuauteb0n6ynfbg9eryu",
                 "image": "https://www.edamam.com/food-img/e31/e310952d214e78a4cb8b73f30ceeaaf2.jpg"
             }
         ],
         "calories": 477.0151688000001,
         "totalWeight": 1036.8942775,
         "totalTime": 0.0,
     }
 }
 */
