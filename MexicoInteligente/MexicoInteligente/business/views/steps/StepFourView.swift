//
//  StepFourView.swift
//  MexicoInteligente
//
//  Created by Dev on 31/03/26.
//

import Foundation
import SwiftUI
import UIKit

struct StepFourView: View {
    
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    @State private var comentarios = ""
    @State private var fecha = Date()
    @State private var mostrarCalendario = false
    @State private var textoFecha: String = ""
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
    
    
    var body: some View {
        
        GenericZStackWithoutBack(titleToolbar: "Detalles del Contrato") {
            
            VStack {
                
                StepIndicatorView(currentStep: 4)
                
                ScrollView {
                    
                    VStack {
                        
                        Text("Información adicional sobre el arrendamiento")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 8)
                            .padding([.trailing, .leading], 16)
                            .multilineTextAlignment(.center)
                        
                        GenericTxtField(label: "M2 de renta", keyboardType: .numberPad, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                                
                            }
                        }
                        
                        VStack(spacing: 8) {
                            Text("Fecha de inicio del contrato *")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .padding([.trailing, .leading], 16)
                            
                            TextField("", text: $textoFecha)
                                .frame(height: 40)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .accentColor(.gray)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.trailing, .leading], 8)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                .disabled(true)
                                .padding([.trailing, .leading], 16)
                                .onTapGesture {
                                    mostrarCalendario.toggle()
                                }
                                .popover(isPresented: $mostrarCalendario) {
                                    DatePicker("Selecciona", selection: $fecha, displayedComponents: .date)
                                        .datePickerStyle(.graphical)
                                        .padding()
                                        .presentationDetents([.medium])
                                        .onChange(of: fecha) { nuevaFecha in
                                            textoFecha = dateFormatter.string(from: nuevaFecha)
                                        }
                                }
                        }
                        .padding(.bottom, 8)
                        
                        VStack(spacing: 8) {
                            Text("Comentarios adicionales (opcional)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .padding([.trailing, .leading], 16)
                            
                            ZStack(alignment: .topLeading) {
                                
                                TextEditor(text: $comentarios)
                                    .frame(height: 150)
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .padding(8)
                                    .background(Color.clear)
                                
                                if comentarios.isEmpty {
                                    Text("Agrega cualquier comentario relevante sobre el contrato...")
                                        .font(.system(size: 13, weight: .regular, design: .default))
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 12)
                                        .allowsTightening(false)
                                }
                                
                            }
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                            .padding([.trailing, .leading], 16)
                        }
                        .padding(.bottom, 8)
                        
                    }//End VStack
                    .padding([.leading, .trailing], 8)
                    
                }//End Scrollview
                
                HStack(spacing: 16) {
                    
                    Button("Anterior", action: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            root.path.removeLast()
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 18, alignment: .center)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color(red: 224/255, green: 225/255, blue: 231/255))
                    .cornerRadius(8.0)
                    .padding(.leading, 8)
                    
                    // Botón Siguiente
                    Button("Siguiente", action: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            root.path.append(Routes.StepFive)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 18, alignment: .center)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Colors.redTitles)
                    .cornerRadius(8.0)
                    .padding(.trailing, 8)
                }
                .padding(.horizontal)
                
            }//End VStaack
            .padding(.top, 2)
            .background(Color.white)
            
        }//End GenericZStackWithoutBack
        
    }//End Body
    
}
