//
//  TermsConditionsView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 02/02/26.
//

import Foundation
import SwiftUI
import PDFKit
import UIKit

struct TermsConditionsView: View {
    
    @StateObject private var viewModel = TermsConditionsViewModel()
    @EnvironmentObject var root : Navigation
    @State private var isCheckedPrivacy = false
    @State private var isCheckedPersonal = false
    @State private var isCheckedTerms = false
    @State private var showDialog = false
    let pdfURL = URL(string: "https://www.vepormas.com/recursos/res/html/Asociacion%20numero%20celular2.pdf")
    
    var body: some View {
        
        GenericZStack(titleToolbar: "Aviso de privacidad") {
            
            VStack {
                
                Text("Terminos y condiciones")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    //.padding([.leading, .trailing], 16)
                
                PDFKitRepresentedView(pdfURL: pdfURL!)
                
                Spacer()
                
                Toggle(isOn: $isCheckedPrivacy) {
                    Text("Acepto el presente Aviso de Privacidad.       ")
                }
                .toggleStyle(CheckboxToggleStyle())
                .onChange(of: isCheckedPrivacy) {
                    
                }
                
                Toggle(isOn: $isCheckedPersonal) {
                    Text("Acepto el presente Aviso de Tratamiento de Datos Personales")
                }
                .toggleStyle(CheckboxToggleStyle())
                .onChange(of: isCheckedPersonal) {
                    
                }
                
                Toggle(isOn: $isCheckedTerms) {
                    Text("Acepto los presentes Términos y condiciones")
                }
                .toggleStyle(CheckboxToggleStyle())
                .onChange(of: isCheckedTerms) {
                    
                }
                
                Divider()
                
                GenericBtn(name: "Aceptar", disableBtn: $viewModel.bloqueoBtn) {
                    showDialog = true
                }
            }
            .padding([.leading, .trailing], 16)
            .frame(maxWidth: .infinity)
            
            .customDialog(isPresented: $showDialog) {
                DialogConfirm(
                    isPresented: $showDialog,
                    title: "¡Felicidades!",
                    message: "La cuenta se ha creado exitosamente", isConfirm: false,
                    confirmAction: {
                        UserDefaultsPref.hideCreateRealState = true
                        root.path.removeLast(2)
                    }
                )
            }
            
        }//End GenericZStack
        
    }//End body
    
}

struct PDFKitRepresentedView: UIViewRepresentable {
    let pdfURL: URL

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        if let document = PDFDocument(url: pdfURL) {
            pdfView.document = document
            pdfView.autoScales = true
        }
        return pdfView
    }

    func updateUIView(_ pdfView: PDFView, context: Context) {}
}
