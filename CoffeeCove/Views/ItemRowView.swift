//
//  ItemRowView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/16/23.
//

import SwiftUI

struct ItemRowView: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
//            Image(systemName: "cup.and.saucer")
            Image("thumbnailimg")
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text("$\(item.price)")
            }
        }
    }
}

#Preview {
    ItemRowView(item: MenuItem.example)
}
