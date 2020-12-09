//
//  DisplayView.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020.
//

import SwiftUI

struct DisplayView: View {
    
    let attestation: Attestation
    
    @State var lastBrightness: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image(uiImage: attestation.qrCode)
                //.interpolation(.none)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                
            Text(attestation.textContent)
                //.padding(.horizontal, 40)
                .multilineTextAlignment(.center)
                .font(Font.system(size: 20).bold())
                // .regular(size: 20.0)
                // FontFamily.SFProText.regular.font(size: size)!
        }
        .padding(16)
        .preferredColorScheme(.dark)
        .onAppear {
            updateBrightnessForQRCodeReadability()
            print(attestation.qrCodeContent) }
        .onDisappear() {
            putBrightnessBackToOriginalValue() }
    }
    
    private func updateBrightnessForQRCodeReadability() {
        lastBrightness = UIScreen.main.brightness
        UIScreen.main.brightness = CGFloat(1.0)
    }
    
    private func putBrightnessBackToOriginalValue() {
        UIScreen.main.brightness = lastBrightness
    }
    
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(attestation: .placeHolder)
    }
}
