//
//  TotalView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/18/23.
//

import SwiftUI

struct TotalView: View {
    var totalPrice: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                
                Text("Place Order")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    TotalView(totalPrice: "$100") {
        // action
    }
}
