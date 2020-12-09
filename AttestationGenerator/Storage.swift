//
//  Storage.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020.
//

import Foundation


struct Storage {

    let defaults = UserDefaults.standard
    
    func save(attestation: Attestation) {
        print("saving \(attestation.lastname)")
        defaults.setValue(attestation.lastname, forKey: "lastname")
        defaults.setValue(attestation.firstname, forKey: "firstname")
        defaults.setValue(attestation.dateofbirth, forKey: "dateofbirth")
        defaults.setValue(attestation.cityofbirth, forKey: "cityofbirth")
        defaults.setValue(attestation.address, forKey: "address")
        defaults.setValue(attestation.zip, forKey: "zip")
        defaults.setValue(attestation.city, forKey: "city")
        defaults.setValue(attestation.reason.rawValue, forKey: "reason")
    }
    
    func load() -> Attestation {
        let lastname = defaults.string(forKey: "lastname")
        let firstname = defaults.string(forKey: "firstname")
        let dateofbirth = defaults.object(forKey: "dateofbirth") as? Date
        let cityofbirth = defaults.string(forKey: "cityofbirth")
        let address = defaults.string(forKey: "address")
        let zip = defaults.string(forKey: "zip")
        let city = defaults.string(forKey: "city")
        let reason = defaults.string(forKey: "reason")
        print("loaded \(String(describing: lastname))")
        return Attestation(creation: Date(),
                     lastname: lastname ?? "",
                     firstname: firstname ?? "",
                     dateofbirth: dateofbirth ?? Date(timeIntervalSince1970: 0),
                     cityofbirth: cityofbirth ?? "",
                     address: address ?? "",
                     zip: zip ?? "",
                     city: city ?? "",
                     datetime: Date(),
                     reason: Reason(str: reason)  )
    }
}

private extension Reason {
        
    init(str: String?) {
        guard let str = str else { self = .travail; return }
        self = Reason(rawValue: str) ?? .travail
    }
}

