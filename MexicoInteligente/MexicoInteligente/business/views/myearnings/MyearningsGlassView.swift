//
//  MyearningsGlassView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 16/02/26.
//

import Foundation
import SwiftUI
import UIKit

struct MyearningsGlassView: View {
    
    @StateObject private var viewModel = BaseViewModel()
    @EnvironmentObject var root : Navigation
    @State var movToSearch = ""
    @State var currentPage = 0
    @State var typeSelected = "Activas"
    var segments: [String] = ["Activas", "Cerradas", "Renovaciones"]
    
    private var filteredOperationsList: [OperationsItem] {
        return viewModel.operationsList.filter { operation in
            if currentPage == 1 {
                return operation.typeOpe == .Cerrada
            } else if currentPage == 2 {
                return operation.typeOpe == .Renovada
            } else {
                return operation.typeOpe == .Activa
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            
            Colors.white.edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Colors.redTitles, Color.clear]), startPoint: .top, endPoint: .bottom)
                .frame(height: 700)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                SegmentedCustom(segments: segments.map {
                    "\($0)"
                }, currentPage: $currentPage)
                .padding(.bottom, 8)
                .padding(.top, 24)
                .padding(.trailing, 16)
                .onChange(of: currentPage) {
                    if currentPage == 1 {
                        typeSelected = "Cerradas"
                    } else if currentPage == 2 {
                        typeSelected = "Renovaciones"
                    } else {
                        typeSelected = "Activas"
                    }
                }
                
                //Barra de buscador
                HStack {
                    
                    Image("search", bundle: nil)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18, alignment: .leading)
                        .padding([.leading], 24)
                    
                    TextField("Buscar en \(typeSelected)", text: $movToSearch).onChange(of: movToSearch) {
                        //print($0)
                    }
                    .frame(height: 0)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .accentColor(Colors.graySearch)
                    .textFieldStyle(PlainTextFieldStyle())
                    .disableAutocorrection(true)
                    .keyboardType(.alphabet)
                    
                }
                .frame(height: 40)
                .background(.white)
                .cornerRadius(12)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.7), radius: 5, x: 0, y: 0)
                
                Text("\(typeSelected)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor(Colors.white)
                    .padding(.top, 24)
                
                //Lista de movimientos
                List(filteredOperationsList, id: \.id) { operation in
                    OperationRowView(operation: operation)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets( EdgeInsets(top: 16, leading: 1, bottom: 4, trailing: 1))
                        .onTapGesture {
                            
                        }
                }.listStyle(.plain)
                    .background(Color.clear)
                    .scrollIndicators(.hidden)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], 24)
            //.background(Colors.backgroundView)
            //.background(Colors.white)
            .onTapGesture {
                self.hideKeyboardView()
            }
            
        }//End ZStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.white)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
    }//End body
    
}
