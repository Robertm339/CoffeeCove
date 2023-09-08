//
//  CardDisplayView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/28/23.
//

import SwiftUI

struct CardDisplayView: View {
    @EnvironmentObject var cardVM: CardVM
    @State private var showSheet = false
    
    let card: Card
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cardVM.cards, id: \.self) { card in
                    CardView(card: card)
                }
                .onDelete(perform: deleteCard)
            }
        }
        
        Spacer()
        Button {
            showSheet.toggle()
        } label: {
            Text("Add new Card")
        }
        .buttonStyle(NewPayment(backgroundColor: .blue))
        .sheet(isPresented: $showSheet) {
            NewCardSheet(card: card)
        }
        .onAppear(perform: cardVM.updateCards)
        .padding(.bottom, 90)
//        Spacer()
    }
    
    func deleteCard(at offsets: IndexSet) {
        cardVM.cards.remove(atOffsets: offsets)
        cardVM.saveData()
    }
}

struct NewPayment: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 160, height: 40)
            .foregroundColor(Color.white)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}




#Preview {
    CardDisplayView(card: .example)
        .environmentObject(CardVM())
}
