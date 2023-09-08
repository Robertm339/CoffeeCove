//
//  Settings.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/25/23.
//

import Foundation

class UserInfo: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var dateOfBirth = Date()
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "Robert"
        case lastName = "Martinez"
    }
    
//    func saveData() {
//        if let data = try? JSONEncoder().encode(reminders) {
//            UserDefaults.standard.set(data, forKey: "Reminders")
//        }
//    }
    
//    static let example = UserInfo(firstName: "Robert", lastName: "Martinez", email: "Robertm339@gmail.com")
}


