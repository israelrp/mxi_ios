//
//  MyAccountView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 27/01/26.
//

import Foundation
import SwiftUI
import UIKit

struct MyAccountView: View {
    
    @StateObject private var viewModel = BaseViewModel()
    @EnvironmentObject var root : Navigation
    @State private var showDialog = false
    @State private var showDialogRealState = false
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                VStack{
                    
                    //First Card
                    VStack {
                        
                        Image("userProfile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60, alignment: .center)
                            .padding([.top, .bottom], 8)
                        
                        HStack(alignment: .center) {
                            
                            Spacer()
                            
                            Text("Jorge Alberto")
                                .frame(alignment: .trailing)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .foregroundColor(Colors.textColor)
                                .multilineTextAlignment(.trailing)
                            
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Colors.graySms)
                            
                            Text("Asesor")
                                .frame(alignment: .leading)
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .foregroundColor(Colors.textColor)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        Image("ic_logo")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90, height: 20, alignment: .center)
                            .foregroundStyle(Color.red)
                            .padding(.top, 8)
                        
                        Text("Configuración")
                            .frame(alignment: .leading)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(Colors.redTitles)
                            .multilineTextAlignment(.center)
                            .underline()
                            .padding(.bottom, 24)
                            .padding(.top, 8)
                            .onTapGesture {
                                root.path.append(Routes.Configuration)
                            }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.3), radius: 5, x: 1, y: 1)
                    
                    //Second card
                    VStack {
                        
                        Spacer()
                        
                        OptionsContent(icon: "bank", title: "Datos bancarios y facturación")
                            .onTapGesture {
                                root.path.append(Routes.BankDetails)
                            }
                        
                        Divider()
                            .padding([.leading, .trailing], 16)
                        
                        if !UserDefaultsPref.hideCreateRealState {
                            OptionsContent(icon: "group", title: "Crear nueva inmobiliaria")
                                .onTapGesture {
                                    showDialogRealState = true
                                }
                        } else {
                            OptionsContent(icon: "group", title: "Administrar inmobiliaria")
                                .onTapGesture {
                                    root.path.append(Routes.AdminTeam)
                                }
                        }
                        
                        Divider()
                            .padding([.leading, .trailing], 16)
                        
                        OptionsContent(icon: "closeSesion", title: "Cerrar sesión")
                            .onTapGesture {
                                showDialog = true
                            }
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.3), radius: 5, x: 1, y: 1)
                    .padding(.top, 16)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(24)
                
            }//End ScrollView
            
            .customDialog(isPresented: $showDialog) {
                DialogConfirm(
                    isPresented: $showDialog,
                    title: "¿Estas seguro de cerrar tu sesión?",
                    message: "", isConfirm: true,
                    confirmAction: {
                        // Handle the confirmation action here
                        viewModel.signOut(root: root)
                    }
                )
            }
            
            .customDialog(isPresented: $showDialogRealState) {
                DialogConfirm(
                    isPresented: $showDialogRealState,
                    title: "¿Qué es una cuenta de inmobiliaria?",
                    message: "Con una cuenta de inmobiliaria podrás gestionar a tu equipo de asesores, revisar el avance de sus operaciones y más.", isConfirm: true,
                    confirmAction: {
                        root.path.append(Routes.RealState)
                    }
                )
            }
            
        }//End ZStack
        .background(Colors.white)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
    }//End body
    
}

struct OptionsContent: View {
    let icon: String
    let title: String
    
    var body: some View {
        
        HStack {
            
            Image(icon)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20, alignment: .center)
            //.padding(.leading, 8)
            
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 13, weight: .medium, design: .default))
                .padding(.leading, 8)
            //.foregroundStyle()
            
            Spacer()
            
            Image("arrowRigth")
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15, alignment: .center)
            //.padding(.leading, 8)
        }
        .frame(maxWidth: .infinity, minHeight: 35)
        .padding([.leading, .trailing], 24)
        .padding([.top, .bottom], 4)
        
    }//End body
    
}
