//
//  TermsConditionsViewModel.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 03/02/26.
//

import Foundation
import SwiftUI

class TermsConditionsViewModel: BaseViewModel {
    
    @Published var bloqueoBtn: Bool = false
    @Published var colorBtn: Color = Color(red: 209/255, green: 210/255, blue: 211/255)
    
    
    /*func validateFields() {
        if userName != "" {
            if celPhone.count >= limiteCaracteres {
                celPhone = String(celPhone.prefix(limiteCaracteres))
                successCel = true
            } else {
                successCel = false
            }
        } else {
            print("Concepto vacio")
            successCel = false
        }
        
        if successCel {
            bloqueoBtn = false
            colorBtn = Colors.red
        } else {
            bloqueoBtn = true
            colorBtn = Colors.disableBtn
        }
    }*/
}
