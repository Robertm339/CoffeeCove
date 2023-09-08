//
//  OrderVM.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/18/23.
//

import Foundation

class OrderVM: ObservableObject {
    @Published var items = [MenuItem]()
    @Published var selectedSize: DrinkSize = .small
    
    @Published var favorites: [MenuItem] = []
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func favorite(item: MenuItem) {
        favorites.append(item)
    }
    
    func loadData() {
        // For UserDefaults
    }
    
    func saveData() {
        // For UserDefaults
    }
    
    enum DrinkSize: String, CaseIterable, Identifiable {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
        
        var id: String { self.rawValue }
    }
}
