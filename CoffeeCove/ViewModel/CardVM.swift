//
//  CardVM.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/27/23.
//

import Foundation

class CardVM: ObservableObject {
    @Published var cards = [Card]()
    @Published var cardName = ""
    @Published var cardNumber = ""
    @Published var cardHolderName = ""
    @Published var balance = ""

    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    
    func updateCards() {
        loadData()
    }
    
    func remove(card: Card) {
        if let index = cards.firstIndex(of: card) {
            cards.remove(at: index)
        }
    }
    
    func addCard() {
        let trimmedName = cardName.trimmingCharacters(in: .whitespaces)
        let trimmedNumber = cardNumber.trimmingCharacters(in: .whitespaces)
        let trimmedHolderName = cardHolderName.trimmingCharacters(in: .whitespaces)
        let newBalance = balance
        
        let card = Card(cardName: trimmedName, cardNumber: trimmedNumber, cardHolderName: trimmedHolderName, balance: newBalance)
        cards.insert(card, at: 0)
        saveData()
    }
}
