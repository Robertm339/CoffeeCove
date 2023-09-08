//
//  AccountView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/3/23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var info: UserInfo
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("Full Name") {
                    TextField("First Name", text: $info.firstName)
                    TextField("Last Name", text: $info.lastName)
                }
                
                Section("Date of Birth") {
                    DatePicker("Select Date", selection: $info.dateOfBirth, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
                
                Section("Log in Info") {
                    TextField("Email", text: $info.email)
                    TextField("Password", text: $info.password)
                }
                
                // for testing
                NavigationLink("Info") {
                    PersonalInfoView()
                }
                
            }
        }
    }
}

#Preview {
    SignUpView()
        .environmentObject(UserInfo())
}
