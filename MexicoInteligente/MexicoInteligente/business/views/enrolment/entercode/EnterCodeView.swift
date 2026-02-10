//
//  EnterCodeView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 23/01/26.
//

import Foundation
import SwiftUI

struct EnterCodeView: View {
    
    @Environment(\.scenePhase) var scenePhase
    @EnvironmentObject var root: Navigation
    @State var completeCode: String? = nil
    @State private var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = true
    
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
                    
                    Text("Ingresa el código que te enviamos")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .padding(.top, 24)
                    
                    HStack(alignment: .center) {
                        
                        Text("al número")
                            .frame(alignment: .trailing)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular, design: .default))
                        
                        Text("22 2164 2254")
                            .frame(alignment: .leading)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                    }
                    .frame(width: 220)
                    
                    //Campos de texto de codigo sms
                    SmsFieldCode(completeCode: $completeCode)
                    
                    if timeRemaining != 0 {
                        Text("No recibí el código, enviar nuevamente en \(timeRemaining)s.")
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Colors.red)
                            .padding(.top, 32)
                    } else {
                        Text("No recibí el código, enviar nuevamente.")
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Colors.red)
                            .padding(.top, 32)
                            .onTapGesture {
                                // Action to perform when the label is tapped
                                print("Label tapped via gesture!")
                            }
                    }
                    
                }//End VStack
                .padding(.top, 35)
                
                Spacer()
            }//End VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }//End ZStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.white)
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            root.path.removeLast()
        }){Image("atras").font(Font.system(size:10, design: .serif)).padding(.leading,-6)})
        .onTapGesture {
            print("Tocando otra parte")
            self.hideKeyboard()
        }
        .onReceive(timer) { time in
            guard isActive else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                isActive = true
            } else {
                isActive = false
            }
        }
        
    }//End body
    
}

struct SmsFieldCode: View {
    
    @EnvironmentObject var root: Navigation
    
    @Binding var completeCode: String?
    @State private var codOne = ""
    @State private var codTwo = ""
    @State private var codThree = ""
    @State private var codFour = ""
    @State private var codFive = ""
    @State private var codSix = ""
    @State private var valCod1 = false
    @State private var valCod2 = false
    @FocusState private var focusCod1: Bool
    @FocusState private var focusCod2: Bool
    @State private var valCod3 = false
    @FocusState private var focusCod3: Bool
    @State private var valCod4 = false
    @FocusState private var focusCod4: Bool
    @State private var valCod5 = false
    @FocusState private var focusCod5: Bool
    @State private var valCod6 = false
    @FocusState private var focusCod6: Bool
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            GenericSmsTxt(label: "", isFocused: _focusCod1, value: $codOne) { newValue in
                codOne = String(newValue.prefix(1))
                
                if newValue != "" {
                    valCod1 = true
                    focusCod2 = true
                } else {
                    valCod1 = false
                }
            }
            
            GenericSmsTxt(label: "", isFocused: _focusCod2, value: $codTwo) { newValue in
                codTwo = String(newValue.prefix(1))
                
                if newValue != "" {
                    valCod2 = true
                    focusCod3 = true
                } else {
                    valCod2 = false
                    focusCod1 = true
                }
            }
            
            GenericSmsTxt(label: "", isFocused: _focusCod3, value: $codThree) { newValue in
                codThree = String(newValue.prefix(1))
                
                if newValue != "" {
                    valCod3 = true
                    focusCod4 = true
                } else {
                    valCod3 = false
                    focusCod2 = true
                }
            }
            
            GenericSmsTxt(label: "", isFocused: _focusCod4, value: $codFour) { newValue in
                codFour = String(newValue.prefix(1))
                
                if newValue != "" {
                    valCod4 = true
                    focusCod5 = true
                } else {
                    valCod4 = false
                    focusCod3 = true
                }
            }
            
            GenericSmsTxt(label: "", isFocused: _focusCod5, value: $codFive) { newValue in
                codFive = String(newValue.prefix(1))
                
                if newValue != "" {
                    valCod5 = true
                    focusCod6 = true
                } else {
                    valCod5 = false
                    focusCod4 = true
                }
            }
            
            GenericSmsTxt(label: "", isFocused: _focusCod6, value: $codSix) { newValue in
                codSix = String(newValue.prefix(1))
                
                if newValue != "" {
                    valCod6 = true
                    self.hideKeyboardView()
                    
                    completeCode = "\(codOne)\(codTwo)\(codThree)\(codFour)\(codFive)\(codSix)"
                    
                    print("Codigo metido:: \(completeCode ?? "nada")")
                    UserDefaultsPref.userId = 12
                    UserDefaultsPref.userName = "Jorge Alberto"
                    UserDefaultsPref.userPhone = "2221642245"
                    
                    root.path.append(Routes.MenuNavigation)
                } else {
                    valCod6 = false
                    focusCod5 = true
                }
            }
            
        }//End HStack de codigos
        .padding([.top], 40)
        
    }
    
}
