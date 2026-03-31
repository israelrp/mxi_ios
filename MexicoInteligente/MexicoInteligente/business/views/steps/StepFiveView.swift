//
//  StepFiveView.swift
//  MexicoInteligente
//
//  Created by Dev on 31/03/26.
//

import Foundation
import SwiftUI
import UIKit

struct StepFiveView: View {
    
    @EnvironmentObject var root : Navigation
    @State private var celular = ""
    @State var indexSelected = false

    var body: some View {
        
        GenericZStackWithoutBack(titleToolbar: "Seguro de Propiedad") {
            
            VStack {
                
                StepIndicatorView(currentStep: 5)
                
                ScrollView{
                    
                    VStack {
                        
                        Text("Protege tu inversión (Opcional)")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 8)
                            .padding([.trailing, .leading], 16)
                            .multilineTextAlignment(.center)
                        
                        VStack {
                            Text("El seguro de propiedad es opcional. Puedes seleccionar un paquete o continuar sin seguro.")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Colors.yellow) // Color vino
                                .multilineTextAlignment(.center)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity) // Para que se estire horizontalmente
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 254/255, green: 252/255, blue: 229/255, opacity: 1))
                        )
                        .padding() // Margen externo
                        
                        VStack {
                            
                            HStack {
                                
                                Text("Seguro Básico")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    //.multilineTextAlignment(.leading)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .foregroundColor(Colors.redTitles)
                            }
                            .padding([.leading], 16)
                            .padding(.top, 16)
                            
                            Text("Cobertura esencial para tu propiedad")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 14, weight: .semibold, design: .default))
                                .foregroundColor(Color.black)
                                .padding([.leading, .trailing], 16)
                                .padding(.bottom, 10)
                                .padding(.top, 4)
                            
                            coberturaComponent(title: "CONTENIDOS 250,000")
                            coberturaComponent(title: "RESPONSABILIDAD CIVIL FAMILIAS 1,000,000")
                            coberturaComponent(title: "RESPONSABILIDAD CIVIL ARRENDATARIO")
                            coberturaComponent(title: "REMOCION ESCOMBROS")
                            coberturaComponent(title: "CRISTALES")
                            coberturaComponent(title: "ROBO DE CONTENIDO")
                            
                            Text("Precio anual (IVA incluido):")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(Color.black)
                                .padding([.leading, .trailing, .top], 16)
                            
                            Text("$1.00 MXN")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 13, weight: .bold, design: .default))
                                .foregroundColor(Color.black)
                                .padding([.leading, .trailing], 16)
                                .padding(.bottom, 6)
                            
                            VStack {
                                Text("Suma asegurada: $1,000,000.00 MXN.")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(Colors.white) // Color vino
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity) // Para que se estire horizontalmente
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Colors.greenStatus) // Color rosa claro
                            )
                            .padding() // Margen externo
                        }
                        .frame(maxWidth: .infinity)
                        //.background(Colors.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(indexSelected ? Colors.redTitles : Colors.grayStatus, lineWidth: 1)
                                .fill(indexSelected ? Color(red: 196/255, green: 2/255, blue: 23/255, opacity: 0.1) : Color.clear)
                        )
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 8)
                        .onTapGesture {
                            indexSelected.toggle()
                        }
                        
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
                    Button("Continuar", action: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            root.path.append(Routes.StepSix)
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
                
            }
            .padding(.top, 2)
            .background(Color.white)
            
        }//End GenericZStackWithoutBack
        
    }//End Body
    
}

struct coberturaComponent: View {
    let title: String
    
    var body: some View {
        
        HStack {
            
            Image("cheque")
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundStyle(Colors.greenStatus)
            
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
