//
//  Extensions.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 22/01/26.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func hideKeyboardView() {
        UIApplication.shared.hideKeyboard()
    }
    
    func customDialog(isPresented: Binding<Bool>, content: @escaping () -> DialogConfirm) -> some View {
        self.modifier(CustomDialogModifier(isPresented: isPresented, content: content))
    }
}

extension UIApplication {
    
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Date {
    
    static func getDateFormat(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, HH:mm a"
        dateFormatter.locale = Locale(identifier: "es_MX")
        
        return dateFormatter.string(from: date)
    }
    
}
