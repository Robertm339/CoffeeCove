//
//  SecurityInfoView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/25/23.
//

import SwiftUI

struct SecurityInfoView: View {
    @EnvironmentObject var info: UserInfo
    
    var body: some View {
        VStack {
            Text(info.email)
        }
    }
}

#Preview {
    SecurityInfoView()
        .environmentObject(UserInfo())
}
