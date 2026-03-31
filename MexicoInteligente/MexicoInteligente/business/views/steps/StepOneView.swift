//
//  StepOneView.swift
//  MexicoInteligente
//
//  Created by Dev on 30/03/26.
//

import Foundation
import SwiftUI
import UIKit

struct StepOneView: View {
    
    //@StateObject private var viewModel = ConfigurationViewModel()
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    @State private var lada = ""
    @State private var disableBtn = false
    @State var selection1: String? = nil
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Información del inmueble") {
            
            VStack {
                
                StepIndicatorView(currentStep: 1)
                
                ScrollView {
                    
                    VStack {
                        
                        Text("Ingresa los datos de la propiedad en renta")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 16)
                        
                        GenericTxtField(label: "¿Cuál es el costo de renta menusal? *", keyboardType: .numberPad, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "Calle *", keyboardType: .default, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "Número interior *", keyboardType: .default, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "Colonia *", keyboardType: .default, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "Municipio/Alcaldía *", keyboardType: .default, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "Estado *", keyboardType: .default, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "Código Postal *", keyboardType: .numberPad, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        VStack(spacing: 4) {
                            
                            Text("¿Qué uso se dará al inmueble en renta?")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14, weight: .regular, design: .default))
                            
                            DropDownPicker(
                                selection: $selection1,
                                options: [
                                    "Habitacional",
                                    "Terreno",
                                    "Oficina",
                                    "Bodega",
                                    "Local comercial"
                                ]
                            )
                        }
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 24)
                        
                    }//End VStack
                    .padding([.leading, .trailing], 8)
                    
                }//End Scrollview
                
                Button("Siguiente", action: {
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        root.path.append(Routes.StepTwo)
                    }
                })
                .frame(maxWidth: .infinity)
                .frame(height: 18, alignment: .center)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .padding()
                .foregroundStyle(Colors.white)
                .background(disableBtn ? Colors.disableBtn : Colors.redTitles)
                .cornerRadius(8.0)
                .padding([.leading, .trailing], 24)
                            
            }//End VStack
            .padding(.top, 2)
            .background(Colors.white)
            
        }//End GenericZStack
        
    }//End body
    
}
