
//  Header.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/19/23.
//

import SwiftUI

struct Header: View {
    let title: String
    let total: String
    let skyBlue = Color(red: 0.46, green: 0.48, blue: 1.0)
    let color1 = Color(red: 0.46, green: 0.63, blue: 1.0)
    let color2 = Color(red: 0.96, green: 0.63, blue: 0.48)
    let color3 = Color("color3")
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
//                .foregroundStyle(Color("color3").gradient)
//                .fill(.linearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing))
                .fill(.linearGradient(colors: [skyBlue, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 450, height: 220)
//                .brightness(-0.05)
                
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.system(size: 34, weight: .bold))

                    
                    Text(total)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                }
                .padding(.top, 45)
                
                Spacer()
            }
            .padding(.horizontal, 50)
        }

    }
}

#Preview {
    Header(title: "Title", total: "$0")
}
