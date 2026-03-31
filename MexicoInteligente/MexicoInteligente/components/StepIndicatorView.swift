//
//  StepIndicatorView.swift
//  MexicoInteligente
//
//  Created by Dev on 30/03/26.
//

import SwiftUI

struct StepIndicatorView: View {
    // El paso actual (1-6)
    let currentStep: Int
    let totalSteps: Int = 6
    
    var body: some View {
        ZStack {
            // Fondo con las 3 secciones sombreadas
            //BackgroundSections()
            
            // Línea conectora base (gris)
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 4)
                .padding(.horizontal, 40)
            
            // Los 6 círculos con números
            HStack(spacing: 0) {
                ForEach(1...totalSteps, id: \.self) { step in
                    StepCircle(step: step, isActive: step <= currentStep)
                    
                    // Espaciador proporcional entre círculos
                    if step != totalSteps {
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 32)
        }
        .frame(height: 50) // Altura del componente
    }
}

// Componente para cada círculo individual
struct StepCircle: View {
    let step: Int
    let isActive: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(isActive ? Colors.redTitles : Color.white)
                .overlay(
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .frame(width: 35, height: 35)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
            
            Text("\(step)")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(isActive ? .white : .black)
        }
    }
}

// Componente para las 3 franjas de fondo
struct BackgroundSections: View {
    var body: some View {
        HStack(spacing: 2) {
            // Sección 1 (Pasos 1-2)
            Color.gray.opacity(0.05)
            // Sección 2 (Pasos 3-4) - Un poco más oscura como en la imagen
            Color.gray.opacity(0.12)
            // Sección 3 (Pasos 5-6)
            Color.gray.opacity(0.05)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
