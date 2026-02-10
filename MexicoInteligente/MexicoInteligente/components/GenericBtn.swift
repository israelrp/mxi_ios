//
//  GenericBtn.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 03/02/26.
//

import Foundation
import SwiftUI

struct GenericBtn: View {
    
    var name: String
    @Binding var disableBtn: Bool
    let action: () -> ()
    
    var body: some View {
        
        VStack {
            
            Button(self.name, action: {
                action()
                print("Boton generico presionado")
            })
            .frame(width: 200, height: 18, alignment: .center)
            .font(.system(size: 18, weight: .semibold, design: .default))
            .padding()
            .foregroundStyle(Colors.white)
            .background(disableBtn ? Colors.disableBtn : Colors.redTitles)
            .cornerRadius(8.0)
            .padding(.top, 24)
            .disabled(disableBtn)
        }
        
    }//End body
    
}//End View
