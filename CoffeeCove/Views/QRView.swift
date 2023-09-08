//
//  QRView.swift
//  CoffeeCove
//
//  Created by Robert Martinez on 9/1/23.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct QRView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        VStack {
            Image(uiImage: generateQRCode(from: ""))
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 200, height: 200)
                .shadow(radius: 14)
            
//            Spacer()
            
            Text("Scan to Pay in store")
                .font(.system(size: 34))
                .padding(.top, 40)
        }
        .padding(.vertical, 30)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    QRView()
}
