//
//  FormModel.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020.
//

import Foundation
import Combine


class FormModel : ObservableObject {

    @Published var lastname: String
    @Published var firstname: String
    @Published var dateofbirth: Date
    @Published var cityofbirth: String
    @Published var address: String
    @Published var zip: String
    @Published var city: String
    @Published var datetime: Date
    @Published var reason: Reason
    
    @Published var attestation: Attestation
    
    
    private var attestationPublisher: AnyPublisher<Attestation, Never>  {
        Publishers.CombineLatest4(
                    Publishers.CombineLatest($lastname, $firstname),
                    Publishers.CombineLatest($dateofbirth, $cityofbirth),
                    Publishers.CombineLatest3($address, $zip, $city),
                    Publishers.CombineLatest($datetime, $reason))
            .map { name, birth, address, reason in
                    Attestation(creation: Date(),
                                lastname: name.0,
                                firstname: name.1,
                                dateofbirth: birth.0,
                                cityofbirth: birth.1,
                                address: address.0,
                                zip: address.1,
                                city: address.2,
                                datetime: reason.0,
                                reason: reason.1) }
            .eraseToAnyPublisher()
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        let attestation = Storage().load()
        
        self.lastname = attestation.lastname
        self.firstname = attestation.firstname
        self.dateofbirth = attestation.dateofbirth
        self.cityofbirth = attestation.cityofbirth
        self.address = attestation.address
        self.zip = attestation.zip
        self.city = attestation.city
        self.datetime = attestation.datetime
        self.reason = attestation.reason
        self.attestation = attestation
        
        let shared = attestationPublisher.share()
        
        shared
            .sink { Storage().save(attestation: $0) }
            .store(in: &cancellables)
        
        shared
            .assign(to: \.attestation, on: self)
            .store(in: &cancellables)
    }
    
}

