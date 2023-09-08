//
//  MenuItem.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/3/23.
//

import Foundation
import SwiftUI

struct MenuSection: Codable, Hashable {
//    var id: UUID 
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Hashable {
//    var id: UUID
    var name: String
    var price: Int
    var ingredients: [String]
    var description: String
    var calorie: Int
    
    var image: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    var thumbnailImage: String {
        "\(image)-thumb"
    }
    
    static let example = MenuItem(name: "Coffee", price: 4, ingredients: ["Milk", "Sugar"], description: "Rich espresso combined with steamed milk and chocolate.", calorie: 20)
}




