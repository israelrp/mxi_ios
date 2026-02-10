//
//  AdminTeamView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 03/02/26.
//

import Foundation
import SwiftUI
import UIKit

struct AdminTeamView: View {
    
    @StateObject private var viewModel = AdminTeamViewModel()
    @EnvironmentObject var root : Navigation
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Administrar equipo") {
            
            VStack {
                
                VStack {
                    
                    Text("Registra a un colaborador")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(Colors.redTitles)
                        .multilineTextAlignment(.trailing)
                        .padding([.leading, .trailing, .top], 16)
                    
                    Text("Registra al asesor en tu inmobiliaria")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.trailing)
                        .padding([.leading, .trailing], 16)
                        .padding([.bottom, .top], 2)
                    
                    GenericBtn(name: "Registrar colaborador", disableBtn: $viewModel.bloqueoBtn) {
                        root.path.append(Routes.CreateAdvisor)
                    }
                    .padding(.bottom, 16)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.3), radius: 5, x: 1, y: 1)
                .padding(.top, 16)
                
                Text("Colaboradores")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor(Colors.redTitles)
                    .padding(.top, 24)
                
                Spacer()
                
                //Lista de movimientos
                List(viewModel.teamList, id: \.id) { team in
                    TeamRowView(team: team)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets( EdgeInsets(top: 16, leading: 1, bottom: 4, trailing: 1))
                        .onTapGesture {
                            
                        }
                }.listStyle(.plain)
                    .background(Color.clear)
                    .scrollIndicators(.hidden)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], 24)
            //.background(Colors.backgroundView)
            .background(Colors.white)
            
        }//End GenericZStack
        
    }//End body
    
}
