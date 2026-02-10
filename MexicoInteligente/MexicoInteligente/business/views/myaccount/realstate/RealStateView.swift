//
//  RealStateView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 02/02/26.
//

import Foundation
import SwiftUI
import UIKit

struct RealStateView: View {
    
    @StateObject private var viewModel = RealStateViewModel()
    @EnvironmentObject var root : Navigation
    @State var selection1: String? = nil
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Nueva inmobiliaria") {
            
            ScrollView {
                
                VStack {
                    
                    VStack {
                        
                        Text("Ingresa tus datos y crea tu cuenta de asesor inmobiliario.")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding([.leading, .trailing, .top], 16)
                            .padding(.bottom, 8)
                        
                        GenericTxtField(label: "Nombre", keyboardType: .default, isDisable: false, value: $viewModel.name) { newValue in
                            if newValue != "" {
                                
                            } else {
                                
                            }
                        }
                        
                        GenericTxtField(label: "Correo electrónico", keyboardType: .emailAddress, isDisable: false, value: $viewModel.email) { newValue in
                            if newValue != "" {
                                
                            } else {
                                
                            }
                        }
                        
                        GenericTxtField(label: "Empresa", keyboardType: .default, isDisable: false, value: $viewModel.empresa) { newValue in
                            if newValue != "" {
                                
                            } else {
                                
                            }
                        }
                        
                        GenericTxtField(label: "Número de asesores en tu inmobiliaria", keyboardType: .numberPad, isDisable: false, value: $viewModel.numAdvisors) { newValue in
                            if newValue != "" {
                                
                            } else {
                                
                            }
                        }
                        .padding(.bottom, 8)
                        
                        VStack(spacing: 4) {
                            
                            Text("Selecciona la plaza donde operas principalmente")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14, weight: .regular, design: .default))
                            
                            DropDownPicker(
                                selection: $selection1,
                                options: [
                                    "Ciudad de México",
                                    "Jalisco",
                                    "Puebla",
                                    "Otro"
                                ]
                            )
                        }
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 24)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 10, x: 1, y: 1)
                    .padding([.leading, .trailing], 24)
                    
                    GenericBtn(name: "Registrarme", disableBtn: $viewModel.bloqueoBtn) {
                        root.path.append(Routes.TermsConditions)
                    }
                    .padding(.top, 8)
                    
                }//End VStack
                .padding(.top, 16)
                
            }//End ScrollView
            
        }//End GenericZStack
        
    }//End body
}
