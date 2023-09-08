//
//  ColdCoffeeMenuView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/3/23.
//

import SwiftUI

struct IcedCoffeeMenuView: View {
    let menuItem: MenuItem
    
    var body: some View {
        HStack {
            Image("iced-cm")
                .resizable()
                .scaledToFit()
                .frame(width: 90)
                .clipShape(Circle())
                .overlay(Circle()
                    .strokeBorder(.blue, lineWidth: 1))
                
                
                
            
            VStack {
                Text(menuItem.name)
                    .font(.title)
                
                Text(menuItem.description)
                    .font(.subheadline)
            }
            
        }
        .padding()
    }
}

#Preview {
    IcedCoffeeMenuView(menuItem: .example)
}
