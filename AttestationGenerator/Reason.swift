//
//  Reason.swift
//  AttestationGenerator
//
//  Created by Julien Eyriès on 09/12/2020.
//



enum Reason: String, CaseIterable {
    case travail
    case achats
    case sante
    case famille
    case handicap
    case convocation
    case sportAnimaux = "sport_animaux"
    case missions
    case enfants
}

extension Reason {
    var shortLabel: String {
        switch self {
        case .travail:
            return "Activité professionnelle, enseignement et formation"
        case .achats:
            return "Achats"
        case .sante:
            return "Consultations et soins"
        case .famille:
            return "Motif familial impérieux, personnes vulnérables ou précaires ou garde d'enfant"
        case .handicap:
            return "Situation de handicap"
        case .convocation:
            return "Convocation judiciaire ou administrative"
        case .sportAnimaux:
            return "Activité individuelle ou animaux de compagnie"
        case .missions:
            return "Missions d'intérêt général"
        case .enfants:
            return "Enfants à l’école"
        }
    }
}


