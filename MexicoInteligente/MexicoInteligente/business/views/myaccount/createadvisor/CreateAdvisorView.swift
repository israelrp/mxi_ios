//
//  CreateAdvisorView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 03/02/26.
//

import Foundation
import SwiftUI
import UIKit

struct CreateAdvisorView: View {
    
    @StateObject private var viewModel = ConfigurationViewModel()
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    @State private var lada = ""
    @State private var isAsesor = false
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Registrar") {
            
            VStack {
                
                VStack {
                    
                    GenericTxtField(label: "Nombre", keyboardType: .default, isDisable: false, value: $viewModel.userName) { newValue in
                        if newValue != "" {
                            
                        } else {
                           
                        }
                    }
                    .padding(.top, 16)
                    
                    GenericTxtField(label: "Número celular", keyboardType: .numberPad, isDisable: true, value: $celular) { newValue in
                        if newValue != "" {
                            
                        } else {
                           
                        }
                    }
                    
                    GenericTxtField(label: "Correo electrónico", keyboardType: .emailAddress, isDisable: false, value: $viewModel.userEmail) { newValue in
                        if newValue != "" {
                            
                        } else {
                           
                        }
                    }
                    .padding(.bottom, 8)
                    
                    Toggle("¿Es administrador?", isOn: $isAsesor)
                        .tint(Colors.redTitles)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 8)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 10, x: 1, y: 1)
                .padding([.leading, .trailing], 24)
                
                GenericBtn(name: "Crear usuario", disableBtn: $viewModel.bloqueoBtn) {
                    
                }
                
                Text("Eliminar usuario")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .padding(.bottom, 4)
                    .foregroundStyle(Colors.redTitles)
                    .underline()
                    .padding(.top, 16)
                    .padding([.leading, .trailing], 16)
                
                Spacer()
                
            }//End VStack
            .padding(.top, 16)
            
        }//End GenericZStack
        
    }//End body
    
}
