//
//  GenericSmsTxt.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 29/01/26.
//

import Foundation
import SwiftUI

struct GenericSmsTxt<T: Equatable>: View {
    let label: String
    @FocusState var isFocused: Bool
    @Binding var value: T
    var onChange: (T) -> Void
    
    var body: some View {
        // Example assumes T is String for simplicity;
        // use Formatter for other types
        TextField(label, text: Binding(
            get: { "\(value)" },
            set: { newValue in
                if let converted = newValue as? T {
                    value = converted
                }
            }
        ))
        .frame(width: 40, height: 40)
        .font(.system(size: 16, weight: .regular, design: .default))
        .accentColor(.gray)
        .textFieldStyle(PlainTextFieldStyle())
        .disableAutocorrection(true)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(value as! String != "" ? Colors.red : Colors.graySms))
        .keyboardType(.numberPad)
        .multilineTextAlignment(.center)
        .focused($isFocused)
        .onChange(of: value) { _, newValue in
            onChange(newValue)
        }
    }
}
