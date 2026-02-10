//
//  HomeView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 26/01/26.
//

import Foundation
import SwiftUI
import UIKit

struct HomeView: View {
    
    @StateObject private var viewModel = BaseViewModel()
    @EnvironmentObject var root : Navigation
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    Text("¡Hola \(UserDefaultsPref.userName)!")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 22, weight: .semibold, design: .default))
                        .foregroundColor(Colors.redTitles)
                        .padding([.trailing, .leading, .top], 24)
                    
                    Text("¿Qué te gustaría hacer hoy?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(Colors.redTitles)
                        .padding([.trailing, .leading], 24)
                        .padding(.bottom, 8)
                    
                    ForEach(viewModel.actionsHomeList) { item in
                        ActionsContent(item: item)
                            .onTapGesture {
                                
                            }
                    }
                    
                    OperationsResumeContent(countActive: "8", countClose: "51", countRenovation: "0")
                    
                }//End VStack
                
            }//End ScrollView
            
        }//End ZStack
        .background(Colors.white)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
    }//End body
    
}

struct ActionsContent: View {
    let item: ActionsHomeItem
    @State private var cardColor = Colors.white
    @State private var cardTextColor = Colors.white
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                ZStack {
                    //Fondo redondo y blanco
                    Circle()
                        .foregroundColor(Color.white)
                    
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .center)
                }
                .frame(width: 60, height: 60)
                .padding(.leading, 8)
                
                Text(item.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 13, weight: .bold, design: .default))
                    .foregroundStyle(cardTextColor)
                
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
        }
        .frame(height: 70)
        .padding(8)
        .background(cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), radius: 5, x: 2, y: 3)
        .padding([.leading, .trailing], 24)
        .padding(.top, 8)
        .onAppear {
            switch item.index {
            case 0:
                cardColor = Colors.cardExp
                cardTextColor = Colors.cardTextExp
            case 1:
                cardColor = Colors.cardInv
                cardTextColor = Colors.cardTextInv
            case 2:
                cardColor = Colors.cardPolizas
                cardTextColor = Colors.cardTextPolizas
            default:
                print("Sin color")
            }
        }
        
    }//End body
    
}

struct OperationsResumeContent: View {
    
    @State var countActive: String
    @State var countClose: String
    @State var countRenovation: String
    
    var body: some View {
        
        VStack {
            
            Text("Resumen de operaciones")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(Color.black)
                .padding(.bottom, 8)
            
            VStack {
                
                //Botones de accion
                HStack(spacing: 8) {
                    
                    Spacer()
                    
                    //Activas
                    VStack {
                        
                        Image("check", bundle: nil)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 22, height: 20, alignment: .leading)
                            .foregroundColor(.gray)
                        
                        Text(countActive)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                        
                        Text("Activas")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Colors.textColor)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.top, .bottom], 16)
                    .onTapGesture {
                        print("Abriendo compartir")
                        //self.goToPay = true
                    }
                    
                    Divider()
                    
                    //Cerradas
                    VStack {
                        
                        Image("folder", bundle: nil)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: .leading)
                            .foregroundColor(.gray)
                        
                        Text(countClose)
                            .font(.system(size: 22, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                        
                        Text("Cerradas")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Colors.textColor)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.top, .bottom], 16)
                    .onTapGesture {
                        print("Abriendo compartir")
                        //self.goToPay = true
                    }
                    
                    Divider()
                    
                    //Renovaciones
                    VStack {
                        
                        Image("recargar", bundle: nil)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: .leading)
                            .foregroundColor(.gray)
                        
                        Text(countRenovation)
                            .font(.system(size: 22, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                        
                        Text("Renovaciones")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Colors.textColor)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.top, .bottom], 16)
                    .onTapGesture {
                        print("Abriendo compartir")
                        //self.goToPay = true
                    }
                    
                    Spacer()
                    
                }//End HStack
                .padding([.top, .bottom], 8)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 10, x: 1, y: 1)
            
        }//End VStack
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing], 24)
        .padding([.top], 24)
        
    }//End body
    
}
