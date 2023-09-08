//
//  Card.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/27/23.
//

import Foundation

struct Card: Hashable, Codable {
    let cardName: String
    let cardNumber: String
    let cardHolderName: String
    let balance: String
    
    static let example = Card(cardName: "Card 1", cardNumber: "1234_5678_8765_4321", cardHolderName: "Robert Martinez", balance: "$0.00")
}
