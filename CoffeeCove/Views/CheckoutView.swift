//
//  CheckoutView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/18/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: OrderVM
    
    @Environment(\.dismiss) var dismiss
    
    enum PaymentTypes: CaseIterable, Identifiable, CustomStringConvertible {
        case cash
        case creditcard
        case rewards
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .cash:
                return "Cash"
            case .creditcard:
                return "Credit Card"
            case .rewards:
                return "Rewards"
            }
        }
    }
    
    @State private var selectedPayment: PaymentTypes = .cash
    
    //    @State private var useCreditCard = false
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var creditCardNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("How do you want to pay?", selection: $selectedPayment) {
                        ForEach(PaymentTypes.allCases) { option in
                            Text(String(describing: option))
                        }
                    }
                    
                    if selectedPayment == .creditcard {
                        HStack {
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                        }
                        TextField("xxxx xxxx xxxx xxxx", text: $creditCardNumber)
                    }
                }
                
                Section("Add a tip?") {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total: \(totalPrice)") {
                    Button("Confirm Order") {
                        showingPaymentAlert.toggle()
                    }
                }
                .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
                    Button("OK") { order.completeOrder() }
//                    order.completeOrder()
                } message: {
                    Text("Your total was \(totalPrice) – Thank you!")
                }
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
    CheckoutView()
        .environmentObject(OrderVM())
}
