//
//  ContentView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "cup.and.saucer")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "list.dash.header.rectangle")
                }
            
            PaymentsView(card: .example, item: .example)
                .tabItem {
                    Label("Rewards", systemImage: "star")
                }
            Account(card: .example)
                .tabItem {
                    Label("Account", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(OrderVM())
        .environmentObject(UserInfo())
        .environmentObject(CardVM())
}
