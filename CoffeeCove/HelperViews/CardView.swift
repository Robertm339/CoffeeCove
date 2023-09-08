//
//  Card.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/27/23.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.linearGradient(colors: [.blue, .cyan, .teal], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 310, height: 170)
            
            VStack {
                Text(card.cardName)
                Text(card.cardNumber)
                Text(card.cardHolderName)
                Text(card.balance)
            }
        }
        
    }
}

#Preview {
    CardView(card: .example)
}
