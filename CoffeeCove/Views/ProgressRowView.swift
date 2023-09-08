//
//  ProgressRowView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 8/25/23.
//

import SwiftUI

struct ProgressRowView: View {
    @State var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "circle.fill")
    
    var offColor = Color.gray
    var onColor = Color.blue
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundStyle(number > rating ? offColor : onColor)
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    ProgressRowView(rating: 4)
}
