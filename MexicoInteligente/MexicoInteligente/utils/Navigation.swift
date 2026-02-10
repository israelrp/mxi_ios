//
//  Navigation.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 22/01/26.
//

import Foundation
import SwiftUI

class Navigation : ObservableObject {
    
    @Published var path = NavigationPath()
    
    func root(){
        path.removeLast(path.count)
    }
}

enum Routes: Hashable {
    case Onboarding
    case PhoneNumber
    case EnterCode
    case MenuNavigation
    case Configuration
    case EarningDetail(step: Int)
    case BankDetails
    case RealState
    case TermsConditions
    case AdminTeam
    case CreateAdvisor
}
