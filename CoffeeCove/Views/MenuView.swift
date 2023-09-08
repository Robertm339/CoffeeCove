//
//  MenuView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/3/23.
//

import SwiftUI

struct MenuView: View {
    let menu: [MenuSection] = Bundle.main.decode("menu.json")
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "Menu", total: "")
                    .ignoresSafeArea() 
                    .padding(.bottom, -65)
                
                List {
                    ForEach(menu, id: \.self) { section in
                        Section {
                            ForEach(section.items, id: \.self) { item in
                                NavigationLink(value: item) {
                                    ItemRowView(item: item)
                                }
                            }
                        } header: {
                            Text(section.name)
                                .font(.system(size: 18, weight: .semibold))
                        }
                    }
                }
//                .searchable(text: $searchText)
                .navigationDestination(for: MenuItem.self) { item in
                    ItemDetailView(item: item)
                }
                .listStyle(.grouped)
            }
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(OrderVM())
}
