//
//  RewardDetailView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/9/23.
//

import SwiftUI

struct RewardDetailView: View {
    let challenge: Challenge
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(challenge.title)
                Text(challenge.description)
                Text("Current Progress: \(challenge.progress)")
                Text("Progress to Complete: \(challenge.completeProgress)")
                Text("Reward Points for challenge completed: \(challenge.rewardPoints)")
            }
            .toolbar {
                ToolbarItem {
                    Button("Done", action: done)
                }
            }
//            .navigationTitle("Yo")
        }
    }
    
    func done() {
        dismiss()
    }
}

#Preview {
    RewardDetailView(challenge: .example)
}
