//
//  ContentView.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var formModel: FormModel = .init()
   
    @State var showDisplay = false
    
    var body: some View {
        formView
            .background(Color(UIColor.systemGray6))
            .sheet(isPresented: $showDisplay) { displayView }
    }
    
    var formView: some View {
        FormView(model: formModel, showDisplay: $showDisplay)
    }
    
    var displayView: some View {
        DisplayView(attestation: formModel.attestation)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Attestation {
    var qrCode: UIImage {
        let image = QRCode.makeQrCode(str: qrCodeContent)!
        return image
    }
}
