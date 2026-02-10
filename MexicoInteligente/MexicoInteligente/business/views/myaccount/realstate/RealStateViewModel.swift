//
//  RealStateViewModel.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 03/02/26.
//

import Foundation
import SwiftUI

class RealStateViewModel: BaseViewModel {
    
    @Published var bloqueoBtn: Bool = false
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var empresa: String = ""
    @Published var numAdvisors: String = ""
    
}
