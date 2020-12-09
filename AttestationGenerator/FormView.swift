//
//  FormView.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020.
//

import SwiftUI


struct FormView: View {
    
    @ObservedObject var model: FormModel
    
    @Binding var showDisplay: Bool
    
    var body: some View {
        Form {
            
            HStack {
                Text("Attestation de déplacement")
                    .font(.largeTitle)
                    .padding()
                    
                Image(uiImage: model.attestation.qrCode)
                    //.interpolation(.none)
                    .resizable()
                    .frame(width: 50, height: 50)
            
            }
            
            Section {
                TextField.init("Prénom", text: $model.firstname)
                TextField.init("Nom", text: $model.lastname)
                DatePicker("Date de naissance", selection: $model.dateofbirth, displayedComponents: .date)
                TextField.init("Lieu de naissance", text: $model.cityofbirth)
            }
            
            Section {
                TextField.init("Adresse", text: $model.address)
                TextField.init("Ville", text: $model.city)
                TextField.init("Code postal", text: $model.zip)
            }
            
            Section {
                DatePicker("Date et heure de sortie", selection: $model.datetime)
                reasonPicker
            }
            
            Section {
                generateButton
            }
            
        }
    }
    
    var reasonPicker: some View {
        HStack {
            
            Picker("Motif de déplacement", selection: $model.reason) {
                ForEach(Reason.allCases, id:\.self) { reason in
                    Text(reason.shortLabel).tag(reason)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Spacer()
            
            Text(model.reason.shortLabel)
        }
    }
    
    var generateButton: some View {
        HStack {
            Spacer()
            Button(action: { showDisplay = true }, label: {
                Text("Générer")
            })
            Spacer()
        }
    }
    
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(model: .init(), showDisplay: .constant(false))
    }
}
