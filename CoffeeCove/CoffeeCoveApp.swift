//
//  CoffeeCoveApp.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/3/23.
//


import SwiftUI

@main
struct CoffeeCoveApp: App {
    @StateObject var order = OrderVM()
    @StateObject var card = CardVM()
    @StateObject var user = UserInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
                .environmentObject(card)
                .environmentObject(user)
        }
    }
}
