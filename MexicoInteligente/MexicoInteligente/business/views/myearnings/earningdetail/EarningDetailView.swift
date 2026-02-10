//
//  EarningDetailView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 29/01/26.
//

import Foundation
import SwiftUI
import UIKit

struct EarningDetailView: View {
    
    @StateObject private var viewModel = BaseViewModel()
    @EnvironmentObject var root : Navigation
    @State private var showMoreInfo = false
    var stepFromBack: Int
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Detalle de operación") {
            
            ScrollView {
                
                VStack {
                    
                    VStack {
                        
                        InfoView(image: "identificador", title: "Operación ID", value: "Valor vaslor")
                            .padding(.top, 16)
                        InfoView(image: "location", title: "Dirección", value: "Valor vaslor")
                        InfoView(image: "home", title: "Uso del inmueble", value: "Valor vaslor")
                        InfoView(image: "inquilino", title: "Inquilino", value: "Valor vaslor")
                        InfoView(image: "money", title: "Monto de la renta mensual", value: "Valor vaslor")
                        
                        if showMoreInfo {
                            InfoView(image: "money", title: "Pena convencional", value: "Valor vaslor")
                            InfoView(image: "money", title: "Depósito en garantía", value: "Valor vaslor")
                            InfoView(image: "calendar", title: "Fecha de inicio de vigencia", value: "Valor vaslor")
                            InfoView(image: "calendar", title: "Fecha de entrega de la propiedad", value: "Valor vaslor")
                                .padding(.bottom, 16)
                        }
                        
                        Text(!showMoreInfo ? "Más" + " información" : "Menos" + " información")
                            .frame(alignment: .leading)
                            .font(.system(size: 14, weight: .semibold, design: .default))
                            .foregroundColor(Colors.redTitles)
                            .multilineTextAlignment(.center)
                            .underline()
                            .padding(.bottom, 24)
                            .onTapGesture {
                                showMoreInfo = !showMoreInfo
                            }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 4, x: 1, y: 1)
                    .padding([.top, .bottom], 16)
                    .padding([.leading, .trailing], 24)
                    
                    Text("Proceso de renta")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(Colors.redTitles)
                        .padding([.leading, .trailing], 24)
                    
                    Text("Da click sobre cada tarjeta para ver el detalle de los pasos de la operación")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .padding([.leading, .trailing], 24)
                        .padding(.top, 2)
                        .padding(.bottom, 4)
                    
                    ProgressLine(completeSteps: stepFromBack, totalSteps: 7)
                        .padding(.top, 2)
                    
                    ForEach(viewModel.stepsList) { item in
                        StepsContent(item: item)
                            .onTapGesture {
                                
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                
            }//End ScrollView
            
        }//End GenericZStack
        
    }//end body
    
}

struct ProgressLine: View {
    
    let completeSteps: Int
    let totalSteps: Int
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                ForEach(0..<totalSteps, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(index < completeSteps ? Colors.redTitles : Colors.grayClear)
                        .frame(height: 10)
                }
                
            }//End HStack
            .padding([.leading, .trailing], 24)
            
            Text("\(completeSteps) / \(totalSteps) completadas")
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .padding(.bottom, 4)
                .foregroundStyle(Colors.grayStatus)
                .padding(.top, 2)
                .padding([.leading, .trailing], 24)
        }
        
    }//End view
    
}

struct StepsContent: View {
    
    let item: StepsItem
    @State private var strokeColor = Colors.white
    
    var body: some View {
        
        VStack {
            
            Text(item.category)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .foregroundColor(Color.black)
                .padding([.leading, .trailing], 24)
                .padding(.bottom, 8)
            
            ForEach(item.steps) { step in
                    
                VStack {
                    
                    Options2Content(icon: step.icon, title: step.title)
                    
                    StatusStepContent(icon: getIconStatus(status: step.status), title: step.status.rawValue, status: step.status)
                    
                    Text(step.description)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .padding([.leading, .trailing], 16)
                        .padding(.bottom, 16)
                }
                .frame(maxWidth: .infinity)
                .background(Colors.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(getColorStatus(status: step.status), lineWidth: 2)
                )
                .padding([.leading, .trailing], 24)
                .padding(.bottom, 8)
                
            }//End for
        }
        
    }//End body
    
    func getColorStatus(status: StatusStep) -> Color {
        switch status {
        case .Pendiente:
            return Colors.orangeStatus
        case .NoDisponible:
            return Colors.grayStatus
        case .Completo:
            return Colors.greenStatus
        }
    }
    
    func getIconStatus(status: StatusStep) -> String {
        switch status {
        case .Pendiente:
            return "alerta"
        case .NoDisponible:
            return "prohibicion"
        case .Completo:
            return "cheque"
        }
    }
}

struct Options2Content: View {
    let icon: String
    let title: String
    
    var body: some View {
        
        HStack {
            
            Image(icon)
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25, alignment: .center)
            
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .padding(.leading, 4)
            
            Spacer()
            
            Image("arrowRigth")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25, alignment: .center)
        }
        .frame(maxWidth: .infinity, minHeight: 30)
        .padding([.leading, .trailing], 16)
        .padding(.top, 16)
        
    }//End body
    
}

struct StatusStepContent: View {
    let icon: String
    let title: String
    let status: StatusStep
    
    var body: some View {
        
        HStack {
            
            Image(icon)
                .renderingMode(.template) 
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundStyle(getColorStatus(status: status))
            
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 14, weight: .bold, design: .default))
                .padding(.leading, 4)
                .foregroundColor(getColorStatus(status: status))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 25)
        .padding([.leading, .trailing], 16)
        
    }//End body
    
    func getColorStatus(status: StatusStep) -> Color {
        switch status {
        case .Pendiente:
            return Colors.orangeStatus
        case .NoDisponible:
            return Colors.grayStatus
        case .Completo:
            return Colors.greenStatus
        }
    }
}
