//
//  RewardRowView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/8/23.
//

import SwiftUI

struct RewardRowView: View {
    let challenge: Challenge
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .opacity(0.4)
                .frame(width: 150, height: 150)
            
            Image(systemName: "cup.and.saucer")
                .font(.system(size: 40))
            
        }
        .padding(4)
    }
}

#Preview {
    RewardRowView(challenge: .example)
}
