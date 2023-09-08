//
//  Challenge.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/8/23.
//

import Foundation

struct Challenge: Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let progress: Int
    let completeProgress: Int
    let rewardPoints: Int
    
    static let example = Challenge(title: "100 points", description: "Make 3 purchases this week for 100 bonus points!", progress: 0, completeProgress: 3, rewardPoints: 100)
}
