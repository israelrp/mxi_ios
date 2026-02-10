//
//  PhoneNumberView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 23/01/26.
//

import Foundation
import SwiftUI

struct PhoneNumberView: View {
    
    @StateObject var viewModel = PhoneNumberViewModel()
    @EnvironmentObject var root: Navigation
    
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .center) {
                
                VStack {
                    
                    Text("Bienvenido a tu App")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                    
                    Image("ic_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 105, height: 35, alignment: .center)
                        .padding(.top, 8)
                        .colorMultiply(Colors.red)
                    
                    Text("Ingresa tu celular para comenzar")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .padding(.top, 24)
                    
                    HStack {
                        
                        HStack {
                            
                            Image("mexico")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 20, alignment: .center)
                            
                            VStack {}
                                .frame(width: 1, height: 30, alignment: .center)
                                .background(Color.gray)
                            
                            Text("+52")
                                .foregroundColor(Color.black)
                                .font(.system(size: 13, weight: .regular, design: .default))
                        }
                        
                        TextField("Ingresa tu numero a 10 digitos", text: $viewModel.celPhone)
                            .frame(height: 45)
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .accentColor(Color.black)
                            .textFieldStyle(PlainTextFieldStyle())
                            .disableAutocorrection(true)
                            .keyboardType(.numberPad)
                            .onChange(of: viewModel.celPhone) {
                                viewModel.validatePhone()
                                
                                if viewModel.successCel {
                                    self.hideKeyboard()
                                }
                            }
                        
                        if viewModel.successCel {
                            Image("success")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        
                    }
                    .frame(width: 265, height: 45)
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .accentColor(.gray)
                    .textFieldStyle(PlainTextFieldStyle())
                    .disableAutocorrection(true)
                    .padding([.horizontal], 16)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                    .background(.white)
                    .padding(.top, 16)
                    
                    GenericBtn(name: "Continuar", disableBtn: $viewModel.bloqueoBtn) {
                        root.path.append(Routes.EnterCode)
                    }
                    
                }//End VStack
                .padding(.top, 80)
                
                Spacer()
            }//End VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }//End ZStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.white)
        .navigationBarTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture {
            print("Tocando otra parte")
            self.hideKeyboard()
        }
        
    }//End body
    
}
