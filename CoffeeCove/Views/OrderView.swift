//
//  OrderView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/18/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: OrderVM
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "Order", total: "Total: $\(order.total)")
                
                Spacer()
                
                VStack {
                    Text("Review your Order")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.vertical, 2)
                    
                    Text("items in order: \(order.itemCount)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    List {
                        Section {
                            ForEach(order.items, id: \.self) { item in
                                VStack(alignment: .leading) {
                                    HStack {
                                        ItemRowView(item: item)
                                        Spacer()
                                        Text(order.selectedSize.rawValue)
                                    }
                                }
                            }
                            .onDelete(perform: deleteItems)
                        }
                    }
                    
                    
                    Button("Place Order") {
                        showSheet.toggle()
                    }
                    .buttonStyle(OrderButton(backgroundColor: order.items.isEmpty ? .gray : .blue))
                    .disabled(order.items.isEmpty)
                    .sheet(isPresented: $showSheet) {
                        CheckoutView()
                    }
                    
                    //                .toolbar {
                    //                    EditButton()
                    //                }
                }
                .padding(.bottom, 98)
            }
            .ignoresSafeArea()
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(OrderVM())
}

struct OrderButton: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 160, height: 40)
            .foregroundColor(Color.white)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
