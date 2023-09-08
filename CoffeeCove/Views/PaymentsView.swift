//
//  PaymentsView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/27/23.
//

import SwiftUI

struct PaymentsView: View {
    @EnvironmentObject var cardVM: CardVM
    
    let card: Card
    let item: MenuItem
    @State private var showSheet = false
    @State private var viewChoice = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "Payments", total: "")
                
                Picker("", selection: $viewChoice) {
                    Text("Pay in Store")
                        .tag(0)
                    Text("Rewards")
                        .tag(1)
                }
                .padding()
                .pickerStyle(.segmented)
                
                if(viewChoice == 0) {
                    QRView()
                }
                if(viewChoice == 1) {
                    StampCardView()
                }
                
                Spacer()
            }
            .ignoresSafeArea()

        }
    }
    
    func deleteCard(at offsets: IndexSet) {
        cardVM.cards.remove(atOffsets: offsets)
        cardVM.saveData()
    }
}

#Preview {
    PaymentsView(card: .example, item: .example)
        .environmentObject(CardVM())
        .environmentObject(OrderVM())
}

