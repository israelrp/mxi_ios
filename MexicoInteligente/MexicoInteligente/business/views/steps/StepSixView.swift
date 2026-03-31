//
//  StepSixView.swift
//  MexicoInteligente
//
//  Created by Dev on 31/03/26.
//

import Foundation
import SwiftUI
import UIKit

struct StepSixView: View {
    
    @EnvironmentObject var root : Navigation
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Resumen de la operación"){
            
            VStack {
                
                StepIndicatorView(currentStep: 6)
                
                ScrollView{
                    
                    VStack {
                        
                        Text("Revisa toda la información antes de registrar")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding([.trailing, .leading], 16)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding([.leading, .trailing], 8)
                    
                    //Info inmueble
                    VStack {
                        
                        textTitleComponent(title: "Información del Inmueble")
                        textDescComponent(descpription: "Dirección: AND MARTIRES 7 DE ENERO UH MARTIRES 7 DE ENERO Edif 10, Centro")
                        textDescComponent(descpription: "Interior: 4545")
                        textDescComponent(descpription: "Estado: Puebla")
                        textDescComponent(descpription: "Municipio: San Martin Texmelucan")
                        textDescComponent(descpription: "CP: 74000")
                        textDescComponent(descpription: "Uso: Local comercial")
                        textDescComponent(descpription: "Renta mensual: $45.00")
                            .padding(.bottom, 16)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Colors.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Colors.grayStatus, lineWidth: 1)
                    )
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
                    
                    //Proteccion
                    VStack {
                        
                        textTitleComponent(title: "Protección")
                        textDescComponent(descpription: "Paquete: Paquete Cobertura Amplia")
                        textDescComponent(descpription: "Pagado por: 50% Inquilino - 50% Propietario")
                            .padding(.bottom, 16)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Colors.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Colors.grayStatus, lineWidth: 1)
                    )
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
                    
                    //Inqui y garantias
                    VStack {
                        
                        textTitleComponent(title: "Inquilino y Garantías")
                        textDescComponent(descpription: "Inquilino: Jorge A.")
                        textDescComponent(descpription: "Requiere fiador: Si")
                        textDescComponent(descpription: "Requiere obligado solidario: No")
                            .padding(.bottom, 16)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Colors.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Colors.grayStatus, lineWidth: 1)
                    )
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
                    
                    //Contract
                    VStack {
                        
                        textTitleComponent(title: "Detalles del Contrato")
                        textDescComponent(descpription: "Área: 23 m2")
                        textDescComponent(descpription: "Fecha inicio: 07/03/2026")
                            .padding(.bottom, 16)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Colors.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Colors.grayStatus, lineWidth: 1)
                    )
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
                    
                    //Seguro
                    VStack {
                        
                        textTitleComponent(title: "Seguro de Propiedad")
                        textDescComponent(descpription: "Paquete: Seguro Básico")
                        textDescComponent(descpription: "Costo anual: $1.00 MXN (IVA incluido)")
                        textDescComponent(descpription: "Suma asegurada: $1,000,000.00 MXN")
                            .padding(.bottom, 16)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Colors.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Colors.grayStatus, lineWidth: 1)
                    )
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
                    
                }//End ScrollView
                
                Button("Registrar operación", action: {
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        root.path.removeLast(6)
                    }
                })
                .frame(maxWidth: .infinity)
                .frame(height: 18, alignment: .center)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .padding()
                .foregroundStyle(Colors.white)
                .background(Colors.redTitles)
                .cornerRadius(8.0)
                .padding([.leading, .trailing], 24)
                
            }//End VStack
            .padding(.top, 2)
            .background(Color.white)
            
        }//End GenericZStackWithoutBack
        
    }//End Body
    
}

struct textDescComponent: View {
    let descpription: String
    
    var body: some View {
            
        Text(descpription)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 14, weight: .medium, design: .default))
            .foregroundColor(Color.black)
            .padding([.leading, .trailing], 16)
            .padding(.top, 2)
        
    }
}

struct textTitleComponent: View {
    let title: String
    
    var body: some View {
            
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 16, weight: .bold, design: .default))
            .foregroundColor(Color.black)
            .padding([.leading, .trailing], 16)
            .padding(.top, 16)
        
    }
}
