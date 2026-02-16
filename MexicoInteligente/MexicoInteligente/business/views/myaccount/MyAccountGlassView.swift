//
//  MyAccountGlassView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 16/02/26.
//

import Foundation
import SwiftUI
import UIKit

struct MyAccountGlassView: View {
    
    @StateObject private var viewModel = BaseViewModel()
    @EnvironmentObject var root : Navigation
    @State private var showDialog = false
    @State private var showDialogRealState = false
    
    var body: some View {
        
        ZStack {
            
            Colors.white.edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Colors.redTitles, Color.clear]), startPoint: .top, endPoint: .bottom)
                .frame(height: 700)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                VStack{
                    
                    //First Card
                    VStack {
                        
                        Image("userProfile")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundStyle(Colors.white)
                            .padding([.top, .bottom], 8)
                        
                        Text("Jorge Alberto")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                            .foregroundColor(Colors.white)
                            .multilineTextAlignment(.trailing)
                        
                        Text("Asesor")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(Colors.white)
                            .multilineTextAlignment(.leading)
                        
                        Text("Configuración")
                            .frame(alignment: .leading)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(Colors.white)
                            .multilineTextAlignment(.center)
                            .underline()
                            .padding(.bottom, 24)
                            .padding(.top, 8)
                            .onTapGesture {
                                root.path.append(Routes.Configuration)
                            }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial) // Creates the glass effect
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 5)
                    
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
