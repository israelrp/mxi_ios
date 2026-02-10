//
//  OperationsItem.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 27/01/26.
//

import Foundation

struct OperationsItem: Identifiable {
    let id = UUID()
    let index: Int
    let step: Int
    let operationsId: String
    let contract: String
    let address: String
    let tenant: String
    let landlord: String
    let dateRenovation: String
    let operationalStatus: OperationalStatus
    let status: Status
    let typeOpe: TypeOperation
}

public enum OperationalStatus: String {
    case Registrada = "Registrada"
    case Habitacional = "Habitacional"
    case LocalComercial = "Local comercial"
    case Vigente = "Vigente"
}

public enum Status: String {
    case Pendiente = "Pendiente"
    case Disponible = "Disponible para revision"
}

public enum TypeOperation {
    case Activa
    case Cerrada
    case Renovada
}
