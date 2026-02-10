//
//  ConfigurationView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 28/01/26.
//

import Foundation
import SwiftUI
import UIKit

struct ConfigurationView: View {
    
    @StateObject private var viewModel = ConfigurationViewModel()
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    @State private var lada = ""
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Configuración") {
            
            VStack {
                
                VStack {
                    
                    Text("Datos personales")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(Colors.redTitles)
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                    
                    GenericTxtField(label: "Nombre del perfil", keyboardType: .default, isDisable: false, value: $viewModel.userName) { newValue in
                        if newValue != "" {
                            
                        } else {
                           
                        }
                    }
                    
                    GenericTxtField(label: "Número celular", keyboardType: .numberPad, isDisable: true, value: $viewModel.userPhone) { newValue in
                        if newValue != "" {
                            
                        } else {
                           
                        }
                    }
                    
                    GenericTxtField(label: "Correo electronico", keyboardType: .emailAddress, isDisable: false, value: $viewModel.userEmail) { newValue in
                        if newValue != "" {
                            
                        } else {
                           
                        }
                    }
                    .padding(.bottom, 8)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 10, x: 1, y: 1)
                .padding([.leading, .trailing], 24)
                
                GenericBtn(name: "Guardar cambios", disableBtn: $viewModel.bloqueoBtn) {
                    
                }
                
                Spacer()
                
            }//End VStack
            .padding(.top, 16)
            
        }//End GenericZStack
        
    }//End body
    
}
