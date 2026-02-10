//
//  OnboardingItem.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 22/01/26.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let index: Int
    let title: String
    let description: String
    let imageName: String
}
