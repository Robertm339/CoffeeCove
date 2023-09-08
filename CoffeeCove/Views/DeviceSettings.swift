//
//  DeviceSettings.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/30/23.
//

import SwiftUI

struct DeviceSettings: View {
    @State private var faceidToggle = false
    @AppStorage("darkModeToggle") private var darkModeToggle = false
    @State private var notificationsToggle = false
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $faceidToggle) {
                    Label("Face ID", systemImage: "faceid")
                }
                Toggle(isOn: $darkModeToggle) {
                    Label("Dark Mode", systemImage: darkModeToggle ? "eye.slash" : "eye")
                }
                .onChange(of: darkModeToggle) { _ , newValue in
                    toggleDarkMode(isOn: newValue)
                }
                
                Toggle(isOn: $notificationsToggle) {
                    Label("Push Notifications", systemImage: notificationsToggle ? "bell" : "bell.slash")
                }
            } header: {
                Text("Device Settings")
                    .font(.system(size: 20, weight: .semibold))
            }
        }
    }
    
    private func toggleDarkMode(isOn: Bool) {
        if isOn {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.overrideUserInterfaceStyle = .dark
            }
            
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.overrideUserInterfaceStyle = .light
            }
            
        }
    }
}

#Preview {
    DeviceSettings()
}
