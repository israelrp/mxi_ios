//
//  BankDetailsView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 30/01/26.
//

import Foundation
import SwiftUI
import UIKit

struct BankDetailsView: View {
    
    @StateObject private var viewModel = BankDetailsModel()
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    @State private var lada = ""
    @State private var isCheckedOk = true
    @State private var isCheckedDiscord = false
    @State var selection1: String? = nil
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Configuración") {
            
            ScrollView {
                
                VStack {
                    
                    //Datos bancarios
                    VStack {
                        
                        Text("Datos bancarios")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(Colors.redTitles)
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                        
                        Text("Datos bancarios para pago de ganancias por operaciones")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding([.leading, .trailing], 16)
                            .padding(.bottom, 8)
                        
                        GenericTxtField(label: "Beneficiario", keyboardType: .default, isDisable: false, value: $viewModel.beneficiary) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "CLABE interbancaria", keyboardType: .numberPad, isDisable: false, value: $viewModel.clabe) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        GenericTxtField(label: "Banco", keyboardType: .default, isDisable: false, value: $viewModel.bank) { newValue in
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
                    
                    //Facturacion
                    VStack {
                        
                        Text("Facturación")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(Colors.redTitles)
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                        
                        Text("¿Quieres recibir los pagos de las ganancias de tu inmobiliaria con IVA?")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding([.leading, .trailing], 16)
                            .padding(.bottom, 8)
                        
                        Toggle(isOn: $isCheckedOk) {
                            Text("Sí, estoy consciente que debo enviar las facturas correspondientes a Mexico Inteligente.")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .onChange(of: isCheckedOk) {
                            isCheckedDiscord = !isCheckedOk
                        }
                        
                        Toggle(isOn: $isCheckedDiscord) {
                            Text("No, no quiero recibir los pagos de mis ganancias con IVA.     ")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .onChange(of: isCheckedDiscord) {
                            isCheckedOk = !isCheckedDiscord
                            
                            if !isCheckedOk {
                                selection1 = nil
                            }
                        }
                        .padding(.bottom, 16)
                        
                        if isCheckedOk {
                            VStack(spacing: 4) {
                                
                                Text("Elige tu régimen fiscal (si tienes más de uno, elige con cuál emitirás la factura)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                
                                DropDownPicker(
                                    selection: $selection1,
                                    options: [
                                        "General de Ley Personas Morales",
                                        "Personas Morales con fines no Lucrativos",
                                        "Sueldos y Salarios e Ingresos asimilados a Salarios",
                                        "Arrendamiento"
                                    ]
                                )
                            }
                            .padding([.leading, .trailing], 16)
                            .padding(.bottom, 24)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 10, x: 1, y: 1)
                    .padding([.leading, .trailing], 24)
                    .padding(.top, 16)
                    
                    GenericBtn(name: "Guardar cambios", disableBtn: $viewModel.bloqueoBtn) {
                        
                    }
                    
                    Spacer()
                    
                }//End VStack
                .padding(.top, 16)
                
            }
            
        }//End GenericZStack
        
    }//End body
    
}
