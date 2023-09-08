//
//  StampCardView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 9/1/23.
//

import SwiftUI

struct StampCardView: View {
    @EnvironmentObject var order: OrderVM
    
    var body: some View {
        VStack {
            Text("Order 5 drinks to earn a free drink")
                .font(.system(size: 26))
                .padding()
                .multilineTextAlignment(.center)
            
            Text("Total Free Drinks: \(order.drinkVouchers)")
                .font(.title2)
                .padding()
            
            VStack {
                Text("Progress Until Your Next Reward: \(order.progressTracker)/5")
                    .font(.title2)
                    .padding()
             
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 175, height: 78)
                    
                    ProgressRowView(rating: order.progressTracker)
                        .padding()
                }
            }
            Spacer()
        }
//        .padding()
    }
}

#Preview {
    StampCardView()
        .environmentObject(OrderVM())
}
