//
//  StepTwoView.swift
//  MexicoInteligente
//
//  Created by Dev on 30/03/26.
//

import Foundation
import SwiftUI
import UIKit

struct StepTwoView: View {
    
    //@StateObject private var viewModel = ConfigurationViewModel()
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    @State private var lada = ""
    @State private var disableBtn = false
    @State private var isBasicPackage = true
    @State var selection1: String? = nil
    
    var body: some View {
        
        GenericZStackWithoutBack(titleToolbar: "Paquete de protección") {
            
            VStack {
                
                StepIndicatorView(currentStep: 2)
                
                ScrollView {
                    
                    VStack {
                        
                        Text("Selecciona el paquete que mejor se adapte a tus necesidades")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 2)
                            .multilineTextAlignment(.center)
                        
                        VStack {
                            Text("Monto de renta protegido por mes: $45.00 MXN")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Colors.redTitles) // Color vino
                                .multilineTextAlignment(.center)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity) // Para que se estire horizontalmente
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 196/255, green: 2/255, blue: 23/255, opacity: 0.1)) // Color rosa claro
                        )
                        .padding() // Margen externo
                        
                        cardPackageSelect(isBasic: isBasicPackage)
                        
                        radioProtection()
                        
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
                            root.path.append(Routes.StepThree)
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
                
            }//End VStack
            .padding(.top, 2)
            .background(Color.white)
            
            
        }//End GenericZStack
        
    }//End body
    
}

struct cardPackageSelect: View {
    
    @State var isBasic: Bool
    @State var packBasic = true
    @State var packFull = false
    @State var indexSelected = 1
    
    var body: some View {
        
        ForEach(1...2, id: \.self) { index in
            
            VStack {
                
                HStack {
                    
                    Text(index == 1 ? "Paquete Básico" : "Paquete Cobertura Amplia")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        //.multilineTextAlignment(.leading)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(Colors.redTitles)
                    
                    Spacer()
                    Spacer()
                    
                    Toggle(isOn: index == 1 ? $packBasic : $packFull) {
                    }
                    .labelsHidden()
                    .toggleStyle(OnlyCheckboxToggleStyle())
                    .disabled(true)
                }
                .padding([.leading], 16)
                .padding(.top, 16)
                
                Text("Servicios jurídicos, investigación y asistencia 24/7")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(Color.black)
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 16)
                
                serviceComponent(title: "Servicios jurídicos")
                serviceComponent(title: "Investigación de prospecto y fiador")
                serviceComponent(title: "Contrato de arrendamiento elaborado por especialistas")
                serviceComponent(title: "Asistencia y respaldo jurídico 24/7")
                
                Text("No hay precio configurado para este monto de renta")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(Colors.red)
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity)
            //.background(Colors.white)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(index == indexSelected ? Colors.redTitles : Colors.grayStatus, lineWidth: 1)
                    .fill(index == indexSelected ? Color(red: 196/255, green: 2/255, blue: 23/255, opacity: 0.1) : Color.clear)
            )
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 8)
            .onTapGesture {
                indexSelected = index
                isBasic.toggle()
                packBasic.toggle()
                packFull.toggle()
            }
            
        }
        
    }
    
}

struct serviceComponent: View {
    let title: String
    
    var body: some View {
        
        HStack {
            
            Image("cheque")
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundStyle(Colors.redTitles)
            
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 13, weight: .regular, design: .default))
                .padding(.leading, 4)
                .foregroundColor(Color.black)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 25)
        .padding([.leading, .trailing], 16)
        
    }//End body
}

struct radioProtection: View {
    // 2. Estado para la opción seleccionada
    @State private var seleccion: String? = "100% propietario"
    
    let opciones = [
        "100% propietario",
        "100% inquilino",
        "50% inquilino - 50% propietario"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("¿Quién cubrirá el costo de la protección? *")
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
