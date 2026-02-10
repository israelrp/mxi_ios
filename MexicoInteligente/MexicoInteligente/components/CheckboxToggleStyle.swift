//
//  CheckboxToggleStyle.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 30/01/26.
//

import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            
            ZStack {
                
                Circle()
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 20, height: 20)
                
                Circle()
                    .fill(configuration.isOn ? Colors.redTitles : Colors.white)
                    .frame(width: 13, height: 13)
            }
            .frame(width: 25)
            .onTapGesture { configuration.isOn.toggle() }
            
            /*Image(configuration.isOn ? "enablecheck" : "disablecheck")
                .resizable()
                .frame(width: 16, height: 16)*/
                
            configuration.label
                .frame(maxWidth: .infinity)
                .font(.system(size: 13, weight: .regular, design: .default))
                .multilineTextAlignment(.leading)
                .foregroundColor(configuration.isOn ? Colors.redTitles : Color.black)
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing], 16)
    }
}
