//
//  DialogConfirm.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 30/01/26.
//

import Foundation
import SwiftUI

struct DialogConfirm: View {
    
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 1000
    //let action: () -> Bool
    let title: String
    let message: String
    let isConfirm: Bool
    let confirmAction: () -> Void
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                
                VStack {
                    
                    VStack {
                        
                    }.frame(maxWidth: .infinity, minHeight: 70, alignment: .center)
                        .background(.clear)
                    
                    VStack {
                        
                        VStack(spacing: 5) {
                            
                            Text(title)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                
                            
                            if message != "" {
                                Text(message)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .multilineTextAlignment(.center)
                                    .padding([.leading, .trailing], 24)
                            }
                            
                            HStack(spacing: 16) {
                                
                                if isConfirm {
                                    Button("Cancelar", action: {
                                        closeDialog()
                                    })
                                    .frame(width: 120, height: 15)
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .padding()
                                    .foregroundStyle(Colors.redTitles)
                                    .background(Colors.white)
                                    .cornerRadius(8.0)
                                }
                                
                                Button("Aceptar", action: {
                                    confirmAction()
                                    closeDialog()
                                })
                                .frame(width: 120, height: 15)
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .padding()
                                .foregroundStyle(Colors.redTitles)
                                .background(Colors.white)
                                .cornerRadius(8.0)
                                
                            }.frame(maxWidth: .infinity, alignment: .bottom)
                                .padding([.top], 10)
                        }
                        
                    }.frame(maxWidth: .infinity, minHeight: 219, alignment: .center)
                        .background(Colors.white)
                        .padding([.top], 38)
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(.clear)
                
                VStack {
                    Image(isConfirm ? "warning" : "success2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100, alignment: .top)
                        .foregroundColor(.gray)
                        .background(isConfirm ? Colors.colorIcWarning : Colors.colorIcSuccess)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, style: StrokeStyle(lineWidth: 10)))
                }
                .frame(alignment: .top)
                .padding([.bottom], 130)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 266, alignment: .center)
            .background(Colors.redTitles)
            .cornerRadius(15)
            .padding([.horizontal], 16)
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            closeDialog()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .fontWeight(.medium)
                        }.tint(.white)
                    }
                    
                    Spacer()
                }
                .padding([.horizontal], 16)
                .padding()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.45).edgesIgnoringSafeArea(.all))
        .offset(x: 0, y: offset)
        .onAppear {
            withAnimation(.spring()) {
                offset = 0
            }
        }
        
    }
    
    func closeDialog() {
        isPresented = false
        withAnimation(.spring()) {
            offset = 1000
        }
    }
}

/*DialogConfirm(isPresented: $showDialog) { value in
    print("Recibido del diálogo: \(value)") // Aquí manejas el valor retornado
}*/
