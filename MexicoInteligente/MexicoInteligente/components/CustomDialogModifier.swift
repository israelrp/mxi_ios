//
//  CustomDialogModifier.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 30/01/26.
//

import Foundation
import SwiftUI

struct CustomDialogModifier<DialogContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    var content: () -> DialogContent
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                /*Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }
                
                self.content()
                    .transition(.scale)*/
                self.content()
            }
        }
    }
}
