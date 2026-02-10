//
//  StepsItem.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 29/01/26.
//

import Foundation

struct StepsItem: Identifiable {
    let id = UUID()
    let category: String
    let steps: [Steps]
}

struct Steps: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let status: StatusStep
    let description: String
}

public enum StatusStep: String {
    case Pendiente = "Pendiente"
    case NoDisponible = "No disponible"
    case Completo = "Completo"
}
