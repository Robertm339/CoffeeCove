//
//  PersonalInfoView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/25/23.
//

import SwiftUI

struct PersonalInfoView: View {
    @EnvironmentObject var info: UserInfo
    
    var body: some View {
        VStack {
            Text(info.fullName)
            Text(info.email)
            Text("\(info.dateOfBirth.formatted())")    
        }
    }
}

#Preview {
    PersonalInfoView()
        .environmentObject(UserInfo())
}
