//
//  NewCardSheet.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/27/23.
//

import SwiftUI

struct NewCardSheet: View {
    let card: Card
    @EnvironmentObject var cardVM: CardVM
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Card Name", text: $cardVM.cardName)
                        TextField("Card Number", text: $cardVM.cardNumber)
                        TextField("Card Holder's Name", text: $cardVM.cardHolderName)
                        TextField("Balance", text: $cardVM.balance)
                    } header: {
                        Text("Card Details")
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding(.vertical, 4)
                    
                    Button {
                        cardVM.addCard()
                    } label: {
                        Text("Add Card")
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Done", action: done)
                }
            }
            .onAppear(perform: cardVM.loadData)
        }
    }
    
    func done() {
        dismiss()
    }
}

#Preview {
    NewCardSheet(card: .example)
        .environmentObject(CardVM())
}
