//
//  GenericZStack.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 02/02/26.
//

import Foundation
import SwiftUI

// Componente ZStack Genérico
struct GenericZStack<Content: View>: View {
    
    @EnvironmentObject var root : Navigation
    let titleToolbar: String
    let content: () -> Content
    
    init(titleToolbar: String = "", @ViewBuilder content: @escaping () -> Content) {
        self.titleToolbar = titleToolbar
        self.content = content
    }
    
    var body: some View {
        
        ZStack {
            content()
        }//End ZStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.white)
        .navigationBarTitle(titleToolbar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            root.path.removeLast()
        }){Image("atras").font(Font.system(size:10, design: .serif)).padding(.leading, 6)})
        .onTapGesture {
            print("Tocando otra parte")
            self.hideKeyboard()
        }
        
    }//End body
}
