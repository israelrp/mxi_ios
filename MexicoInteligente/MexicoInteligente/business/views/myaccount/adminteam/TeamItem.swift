//
//  TeamItem.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 03/02/26.
//

import Foundation

struct TeamItem: Identifiable {
    let id = UUID()
    let index: Int
    let name: String
    let cel: String
    let email: String
    let isAsesor: Bool
    let date: String
}
