//
//  HomeView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var order: OrderVM
    
    var formattedDate: String {
        let date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "Welcome", total: formattedDate)
                
                VStack {
                    Text("Favorites")
                        .font(.system(size: 24, weight: .bold))
//                        .padding(.vertical, 2)
                        

                    ScrollView {
                        ForEach(order.favorites, id: \.self) { favorite in
                            FavoriteRowView(item: favorite)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(OrderVM())
}
