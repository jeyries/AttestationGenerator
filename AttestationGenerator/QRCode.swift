//
//  QRCode.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020
//

import UIKit


struct QRCode {
        
    static func makeQrCode(str: String) -> UIImage? {
        guard let data = str.data(using: .utf8) else { return nil }
        guard let filter = CIFilter(name: "CIQRCodeGenerator")  else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        guard let output = filter.outputImage else { return nil }
        let scaled = output.transformed(by: CGAffineTransform(scaleX: 5, y: 5))
        let image = UIImage(ciImage: scaled)
        return UIImage(data: image.pngData()!)! // not sure why it is needed ...
    }
    
} 

