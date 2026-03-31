//
//  StepThreeView.swift
//  MexicoInteligente
//
//  Created by Dev on 31/03/26.
//

import Foundation
import SwiftUI
import UIKit

struct StepThreeView: View {
    
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    
    var body: some View {
        
        GenericZStackWithoutBack(titleToolbar: "Detalles de renta") {
            
            VStack {
                
                StepIndicatorView(currentStep: 3)
                
                ScrollView {
                    
                    VStack {
                        
                        Text("Ingresa los datos requeridos para continuar con la operación")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 2)
                            .multilineTextAlignment(.center)
                        
                        GenericTxtField(label: "Nombre del inquilino(a) *", keyboardType: .default, isDisable: false, value: $celular) { newValue in
                            if newValue != "" {
                                
                            } else {
                               
                            }
                        }
                        
                        radioFiador()
                        
                        radioSolidario()
                        
                        VStack {
                            Text("Vamos a validar la identidad del inquilino y su número de celular para enviarle la información del contrato. Esto es necesario para continuar con el proceso de manera segura.")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color(red: 0/255, green: 28/255, blue: 105/255, opacity: 1)) // Color vino
                                .multilineTextAlignment(.center)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity) // Para que se estire horizontalmente
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 237/255, green: 244/255, blue: 254/255, opacity: 1)) // Color rosa claro
                        )
                        .padding() // Margen externo
                        
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
                            root.path.append(Routes.StepFour)
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

struct radioFiador: View {
    // 2. Estado para la opción seleccionada
    @State private var seleccion: String? = "Sí, un tercero será fiador"
    
    let opciones = [
        "Sí, un tercero será fiador",
        "No"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("¿El propietario solicita un fiador o una propiedad en garantía?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14, weight: .regular, design: .default))
                .multilineTextAlignment(.leading)
            
            // 3. Implementación con Toggles
            ForEach(opciones, id: \.self) { opcion in
                
                Toggle(opcion, isOn: Binding(
                    get: { self.seleccion == opcion },
                    set: { nuevoValor in
                        if nuevoValor { self.seleccion = opcion }
                    }
                ))
                .toggleStyle(CheckboxToggleStyleMore())
            }
            
        }
        .padding()
    }
}

struct radioSolidario: View {
    // 2. Estado para la opción seleccionada
    @State private var seleccion: String? = "Si"
    
    let opciones = [
        "Si",
        "No"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("¿El propietario solicita un obligado solidario?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14, weight: .regular, design: .default))
                .multilineTextAlignment(.leading)
            
            // 3. Implementación con Toggles
            ForEach(opciones, id: \.self) { opcion in
                
                Toggle(opcion, isOn: Binding(
                    get: { self.seleccion == opcion },
                    set: { nuevoValor in
                        if nuevoValor { self.seleccion = opcion }
                    }
                ))
                .toggleStyle(CheckboxToggleStyleMore())
            }
            
        }
        .padding()
    }
}

