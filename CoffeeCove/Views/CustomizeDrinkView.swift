//
//  CustomizeDrinkView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/24/23.
//

import SwiftUI

struct CustomizeDrinkView: View {
    let item: MenuItem
    
    @EnvironmentObject var order: OrderVM
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("cropped_image")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("color3"), lineWidth: 2))
                
                Text(item.description)
                    .font(.title3)
                    .padding()
                
                Text("Price: $\(item.price)")
                
                Picker("Size", selection: $order.selectedSize) {
                    ForEach(OrderVM.DrinkSize.allCases, id: \.self) { size in
                        Text(size.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                List {
                    Section("Ingredients") {
                        ForEach(item.ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                    }
                }
                
                VStack {
                    Button("Order This") {
                        order.add(item: item)
                    }
                    .buttonStyle(CustomButton(backgroundColor: Color("color3")))
                }
                
//                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button("Done", action: done)
                }
            }
        }
    }
    
    func done() {
        dismiss()
    }
}

#Preview {
    CustomizeDrinkView(item: MenuItem.example)
        .environmentObject(OrderVM())
}
