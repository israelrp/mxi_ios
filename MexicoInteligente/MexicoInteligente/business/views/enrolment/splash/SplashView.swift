//
//  SplashView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 22/01/26.
//

import Foundation
import SwiftUI

struct SplashView: View {
    
    @State private var isFinish = false
    @State private var mostrarImagen = true
    
    //@StateObject var phoneNumberViewModel = PhoneNumberViewModel()
    //@StateObject var homeViewModel = HomeViewModel()
    //@StateObject var profileViewModel = ProfileViewModel()
    //@StateObject var createNoteViewModel = CreateNoteViewModel()
    
    var body: some View {
        if isFinish {
            /*ContentView(viewModel: BaseViewModel())
             .environmentObject(Navigation())
             .environmentObject(phoneNumberViewModel)
             .environmentObject(homeViewModel)
             .environmentObject(profileViewModel)
             .environmentObject(createNoteViewModel)*/
            ContentView(viewModel: BaseViewModel())
                .environmentObject(Navigation())
                //.environmentObject(phoneNumberViewModel)
        } else {
            ZStack {
                
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: .infinity)
                
                //if mostrarImagen {
                Image("ic_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 50, alignment: .center)
                    .opacity(mostrarImagen ? 1 : 0) // Cambia la opacidad según el estado
                    .animation(.easeInOut(duration: 1.0), value: mostrarImagen) // Duración de 2 segundos
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.mostrarImagen = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                self.isFinish = true
                            }
                        }
                    }
                //}
                
            }
            .frame(maxHeight: .infinity)
        }
    }
}

