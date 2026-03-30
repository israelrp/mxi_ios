//
//  GenericBtnSmall.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 24/02/26.
//

import Foundation
import SwiftUI

struct GenericBtnSmall: View {
    
    var name: String
    //@Binding var disableBtn: Bool
    let action: () -> ()
    
    var body: some View {
        
        VStack {
            
            Button(self.name, action: {
                action()
                print("Boton generico presionado")
            })
            .frame(width: 150, height: 10, alignment: .center)
            .font(.system(size: 14, weight: .semibold, design: .default))
            .padding()
            .foregroundStyle(Colors.white)
            .background(Colors.redTitles)
            .cornerRadius(8.0)
            .padding(.top, 24)
            //.disabled(disableBtn)
        }
        
    }//End body
    
}//End View
