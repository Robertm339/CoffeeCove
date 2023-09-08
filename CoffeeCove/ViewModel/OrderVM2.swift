//
//  OrderVM.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/18/23.
//

import Foundation

class OrderVM: ObservableObject {
//    let item: MenuItem?
    
    @Published var items = [MenuItem]()
    @Published var selectedSize: DrinkSize = .small
    @Published var progressTracker: Int = 0
    @Published var drinkVouchers: Int = 0
    
    @Published var favorites = [MenuItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(favorites) {
                UserDefaults.standard.set(encoded, forKey: "Favorites")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Favorites") {
            if let decoded = try? JSONDecoder().decode([MenuItem].self, from: data) {
                favorites = decoded
                return
            }
        }
        
        favorites = []
    }
    
    var itemCount: Int {
        return items.count
    }
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
//    var upgradePrice: Int {
//        if selectedSize == .small {
//            return item.price
//        } else if selectedSize == .medium {
//            return item.price + 1
//        } else if selectedSize == .large {
//            return item.price + 2
//        } else {
//            return item.price
//        }
//    }
    
//    func upgradePrice(item: MenuItem) -> Int {
//        if selectedSize == .small {
//            return item.price
//        } else if selectedSize == .medium {
//            return item.price + 1
//        } else if selectedSize == .large {
//            return item.price + 2
//        } else {
//            return item.price
//        }
//    }
    
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
    
    func removeFavorite(item: MenuItem) {
        if let index = favorites.firstIndex(of: item) {
            favorites.remove(at: index)
        }
    }
    
    func completeOrder() {
        progressTracker += items.count
        if progressTracker >= 5 {
            progressTracker = 0
            drinkVouchers += 1
        }
        
        items = []
    }
    
    enum DrinkSize: String, CaseIterable, Identifiable {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
        
        var id: String { self.rawValue }
    }
}
