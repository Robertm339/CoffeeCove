//
//  FavoriteRowView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/22/23.
//

import SwiftUI

struct FavoriteRowView: View {
    let item: MenuItem
    @EnvironmentObject var order: OrderVM
    
    @State private var showSheet = false
    @State private var showAlert = false
    
    var body: some View {
        HStack {
            Image("thumbnailimg")
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text("$\(item.price)")
            }
            .padding()
            Spacer()
            
            HStack(spacing: 16) {
                Button {
                    order.add(item: item)
                    showSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .buttonStyle(ReorderButton(backgroundColor: Color("color3")))
                .sheet(isPresented: $showSheet) {
                    CustomizeDrinkView(item: item)
                }
                
                Button {
                    showAlert.toggle()
                } label: {
                    Image(systemName: "trash")
                }
                .buttonStyle(RemoveButton(backgroundColor: Color("color4")))
                .alert("Are you sure you want to remove?", isPresented: $showAlert) {
                    Button("Remove", role: .destructive, action: { order.removeFavorite(item: item) })
                }
            }
        }
        .padding(14)
    }
}


#Preview {
    FavoriteRowView(item: MenuItem.example)
        .environmentObject(OrderVM())
}


// custom button to reorder item from favorite
struct ReorderButton: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 42, height: 42)
            .foregroundColor(Color.white)
            .background(backgroundColor)
            .clipShape(Circle())
    }
}

// custom button to remove item from favorite
struct RemoveButton: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 42, height: 42)
            .foregroundColor(Color.white)
            .background(backgroundColor)
            .clipShape(Circle())
    }
}
