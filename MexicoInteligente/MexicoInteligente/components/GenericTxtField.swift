//
//  GenericTxtField.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 29/01/26.
//

import Foundation
import SwiftUI

struct GenericTxtField<T: Equatable>: View {
    let label: String
    let keyboardType: UIKeyboardType
    let isDisable: Bool
    @Binding var value: T
    var onChange: (T) -> Void
    
    var body: some View {
        
        VStack(spacing: 8) {
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14, weight: .regular, design: .default))
            
            TextField("", text: Binding(
                get: { "\(value)" },
                set: { newValue in
                    if let converted = newValue as? T {
                        value = converted
                    }
                }
            ))
            .frame(height: 40)
            .font(.system(size: 14, weight: .regular, design: .default))
            .accentColor(.gray)
            .textFieldStyle(PlainTextFieldStyle())
            .padding([.horizontal], 8)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            .padding([.horizontal], 0)
            .keyboardType(keyboardType)
            .disabled(isDisable)
            .onChange(of: value) { _, newValue in
                onChange(newValue)
            }
        }
        .padding([.leading, .trailing], 16)
        .padding(.bottom, 8)
    }
}
