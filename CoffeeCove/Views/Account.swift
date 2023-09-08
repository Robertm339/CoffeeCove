//
//  Account.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/25/23.
//

import SwiftUI

struct Account: View {
    @EnvironmentObject var user: UserInfo
//    @EnvironmentObject var card: CardVM
    let card: Card
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "Account", total: "")
                
                List {
                    Section {
                        NavigationLink(destination: PersonalInfoView()) {
                            Label("Personal Info", systemImage: "gear")
                        }
                        
                        NavigationLink(destination: SecurityInfoView()) {
                            Label("Security Info", systemImage: "lock")
                        }
                        
                        NavigationLink(destination: DeviceSettings()) {
                            Label("Device Settings", systemImage: "iphone")
                        }
                        
                        NavigationLink(destination: CardDisplayView(card: card)) {
                            Label("Payment Info", systemImage: "iphone")
                        }
                        
                    } header: {
                        Text("Settings")
                            .font(.system(size: 20, weight: .semibold))
                    }
                    
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Account(card: .example)
        .environmentObject(UserInfo())
        .environmentObject(CardVM())
}
