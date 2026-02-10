//
//  ConfigurationViewModel.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 29/01/26.
//

import Foundation
import SwiftUI

class ConfigurationViewModel: BaseViewModel {
    
    @Published var bloqueoBtn: Bool = true
    @Published var successCel: Bool = false
    @Published var userName: String = UserDefaultsPref.userName
    @Published var userPhone: String = UserDefaultsPref.userPhone
    @Published var userEmail: String = ""
    @Published var colorBtn: Color = Color(red: 209/255, green: 210/255, blue: 211/255)
    
    let limiteCaracteres = 10
    
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
