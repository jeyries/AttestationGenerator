//
//  Attestation.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020.
//

import Foundation



struct Attestation {
    
    let creation: Date
    let lastname: String
    let firstname: String
    let dateofbirth: Date
    let cityofbirth: String
    let address: String
    let zip: String
    let city: String
    let datetime: Date
    let reason: Reason
}

// computed properties
extension  Attestation {
    
    var creationDate: String {
        return dayFormatter.string(from: creation)
    }
    
    var creationHour: String {
        return hourFormatter.string(from: creation)
    }
    
    var datetimeDay: String {
        return dayFormatter.string(from: datetime)
    }
    
    var datetimeHour: String {
        return hourFormatter.string(from: datetime)
    }
    
    var reasonCode: String {
        reason.rawValue
    }
    
    var dob: String {
        return dayFormatter.string(from: dateofbirth)
    }
    
    var qrCodeContent: String {
        return """
            Cree le: \(creationDate) a \(creationHour);
            Nom: \(lastname);
            Prenom: \(firstname);
            Naissance: \(dob) a \(cityofbirth);
            Adresse: \(address) \(zip) \(city);
            Sortie: \(datetimeDay) a \(datetimeHour);
            Motifs: \(reasonCode);
            """
    }
    
    var textContent: String {
        return """
            Créé le \(creationDate) à \(creationHour)
            Nom : \(lastname)
            Prénom : \(firstname)
            Naissance : \(dob) à \(cityofbirth)
            Adresse : \(address) \(zip) \(city)
            Sortie : \(datetimeDay) à \(datetimeHour)
            Code motif: \(reason.shortLabel)
            """
    }
    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }
    
    private var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }
}

// for debug
extension  Attestation {
    
    static var placeHolder: Self {
        return .init(creation: Date(),
                     lastname: "Doe",
                     firstname: "John",
                     dateofbirth: Date(timeIntervalSince1970: 0),
                     cityofbirth: "Marseille",
                     address: "999 Any Street",
                     zip: "75000",
                     city: "Paris",
                     datetime: Date(),
                     reason: .travail)
    }
    
    
    
}

