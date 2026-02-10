//
//  OperationRowView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 27/01/26.
//

import Foundation
import SwiftUI

struct OperationRowView: View {
    
    @EnvironmentObject var root : Navigation
    var operation: OperationsItem
    var statusOpeTextColor = Color.black
    var statusOpeBackColor = Color.black
    
    var body: some View {
        
        VStack {
            
            HStack {
                StatusOpeView(image: "proteccion", title: "Protección", textColor: Color.black, backGroundColor: Colors.blueProteccion)
                
                switch operation.operationalStatus {
                case .Registrada:
                    StatusOpeView(image: "registrada", title: operation.operationalStatus.rawValue, textColor: Color.black, backGroundColor: Colors.grayRegistrada)
                case .Habitacional:
                    StatusOpeView(image: "propietario", title: operation.operationalStatus.rawValue, textColor: Color.black, backGroundColor: Colors.yellowHab)
                case .LocalComercial:
                    StatusOpeView(image: "local", title: operation.operationalStatus.rawValue, textColor: Color.black, backGroundColor: Colors.cardExp)
                case .Vigente:
                    StatusOpeView(image: "comprobado", title: operation.operationalStatus.rawValue, textColor: Colors.greenVigenteText, backGroundColor: Colors.greenVigente)
                }
            }
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 8)
            
            StepsView()
            
            ProgressView(value: Double(operation.step), total: 7)
                .progressViewStyle(BarProgressStyle(height: 10.0))
                .padding([.leading, .trailing], 16)
            
            if operation.typeOpe == .Activa {
                InfoView(image: "identificador", title: "ID", value: operation.operationsId)
            } else {
                InfoView(image: "identificador", title: "ID / Contrato", value: "\(operation.operationsId) / \(operation.contract)")
            }
            
            InfoView(image: "home", title: "Dirección", value: operation.address)
            
            if operation.typeOpe == .Cerrada {
                InfoView(image: "propietario", title: "Propietario", value: operation.tenant)
            }
            
            InfoView(image: "inquilino", title: "Inquilino", value: operation.tenant)
            
            if operation.status == .Disponible {
                InfoView(image: "comprobado", title: "Contratos", value: operation.status.rawValue)
            } else {
                InfoView(image: "alerta", title: "Perfil de inquilino", value: operation.status.rawValue)
            }
            
            if operation.typeOpe == .Cerrada {
                InfoView(image: "recargar", title: "Fecha de renovación", value: operation.dateRenovation)
            }
            
            Text("Ver expediente")
                .frame(alignment: .leading)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .foregroundColor(Colors.redTitles)
                .multilineTextAlignment(.center)
                .underline()
                .padding(.bottom, 24)
                .padding(.top, 8)
                .onTapGesture {
                    // Action to perform when the label is tapped
                    root.path.append(Routes.EarningDetail(step: operation.step))
                }
            
        }//End VStack
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 4, x: 1, y: 1)
        .padding([.top, .bottom], 8)
        
    }//End body
    
    func StatusOpeView(image: String, title: String, textColor: Color, backGroundColor: Color) -> some View {
        
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 16, alignment: .center)
                .padding([.top, .bottom], 4)
            
            Text(title)
                .multilineTextAlignment(.leading)
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding([.top, .bottom], 4)
                .foregroundStyle(textColor)
        }
        .frame(maxWidth: .infinity)
        .background(backGroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding([.top, .bottom], 4)
        .padding([.leading, .trailing], 16)
        
    }
    
    func StepsView() -> some View {
        
        HStack {
            
            Text("\(operation.step) / 7")
                .multilineTextAlignment(.leading)
                .font(.system(size: 12, weight: .medium, design: .default))
                .padding(.bottom, 4)
                .foregroundStyle(Colors.redTitles)
            
            Text("Pasos completados")
                .multilineTextAlignment(.leading)
                .font(.system(size: 12, weight: .regular, design: .default))
                .padding(.bottom, 4)
                .foregroundStyle(Color.black)
            
            Spacer()
            
            Text("Editar")
                .multilineTextAlignment(.leading)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .padding(.bottom, 4)
                .foregroundStyle(Colors.redTitles)
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing], 16)
        
    }
}

struct InfoView: View {
    
    @State var image: String
    @State var title: String
    @State var value: String
    
    var body: some View {
        
        HStack {
            
            Image(image)
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundStyle(Colors.redTitles)
                //.padding(.leading, 8)
            
            VStack(alignment: .leading) {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 13, weight: .medium, design: .default))
                    .padding(.leading, 4)
                
                Text(value)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .padding(.leading, 4)
                    .foregroundColor(Colors.graySms)
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, minHeight: 35)
        .padding([.leading, .trailing], 24)
        .padding(.bottom, 2)
        
    }//End body
    
}
