//
//  ItemDetailView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/16/23.
//

import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    
    @EnvironmentObject var order: OrderVM
    
//    let order2 = SomeClass(item: item)
    
    var upgradePrice: Int {
        if order.selectedSize == .small {
            return item.price
        } else if order.selectedSize == .medium {
            return item.price + 1
        } else if order.selectedSize == .large {
            return item.price + 2
        } else {
            return item.price
        }
    }
    
    var body: some View {
        VStack {
            
            //            Image(item.image)
            
            Image("cropped_image")
                .resizable()
                .frame(width: 180, height: 180)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("color3"), lineWidth: 2))
                .shadow(radius: 6)
            
            Text(item.description)
                .font(.system(size: 18))
                .padding(.vertical, 12)
            
            Picker("Size", selection: $order.selectedSize) {
                ForEach(OrderVM.DrinkSize.allCases, id: \.self) { size in
                    Text(size.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.vertical, 12)
            
            HStack {
                Text("$\(upgradePrice)")
                
            }
            .fontWeight(.semibold)
             
            List {
                Section("Ingredients") {
                    ForEach(item.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
            }
            
            Button {
                order.favorite(item: item)
            } label: {
                Label("Favorite", systemImage: "heart")
            }
            .buttonStyle(CustomButton(backgroundColor: Color("color2")))
            .shadow(radius: 6)
            
            Button {
                order.add(item: item)
            } label: {
                Label("Order This", systemImage: "cart")
            }
            .buttonStyle(CustomButton(backgroundColor: Color("color3")))
            .shadow(radius: 6)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ItemDetailView(item: MenuItem.example)
        .environmentObject(OrderVM())
}

struct CustomButton: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 160, height: 40)
            .foregroundColor(Color.white)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
