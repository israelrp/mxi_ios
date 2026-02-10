//
//  Onboarding.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 22/01/26.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var viewModel = BaseViewModel()
    @EnvironmentObject var root : Navigation
    @State private var currentStep = 0
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Text("Omitir")
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .padding(.trailing, 24)
                        .foregroundColor(Colors.red)
                        .underline()
                        .onTapGesture {
                            // Action to perform when the label is tapped
                            print("Label tapped via gesture!")
                            UserDefaultsPref.hideOnboarding = true
                            root.path.append(Routes.PhoneNumber)
                        }
                }
                .padding(.top, 8)
                
                TabView(selection: $currentStep) {
                    ForEach(viewModel.onBoardingList) { item in
                        OnboardingContent(item: item).tag(item.index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.spring(), value: currentStep)
                .onChange(of: currentStep) {
                    print("Cambio a la página: \(currentStep)")
                    // Aquí puedes ejecutar acciones personalizadas
                    if currentStep == 2 {
                        print("Llegaste a la última página")
                    }
                }
                //.indexViewStyle(.page(backgroundDisplayMode: .always))
                
                //Indicators
                HStack(spacing: 8) {
                    ForEach(viewModel.onBoardingList) { item in
                        Circle()
                            .fill(currentStep == item.index ? Color.red : Color.gray)
                            .frame(width: 15, height: 15)
                            .animation(.spring(), value: currentStep)
                    }
                }.padding(.bottom, 24)
                
                Button("Ir al login", action: {
                    UserDefaultsPref.hideOnboarding = true
                    root.path.append(Routes.PhoneNumber)
                })
                .frame(width: 220, height: 18, alignment: .center)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .padding()
                .foregroundStyle(Colors.white)
                .background(currentStep == 2 ? Colors.red : Color.white)
                .cornerRadius(8.0)
                
            }//End Vstack
            
        }//End Zstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.white)
        .navigationBarTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        
    }//End body
    
}

struct OnboardingContent: View {
    let item: OnboardingItem
    
    var body: some View {
        VStack(spacing: 16) {
            
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 260, height: 360, alignment: .center)
                .shadow(color: Colors.graySearch, radius: 10, x: 10, y: 8)
                .padding(.bottom, 24)
            
            Text(item.title)
                .multilineTextAlignment(.center)
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding([.trailing, .leading], 24)
                .padding(.top, 8)
                .foregroundColor(Color.black)
            
            Text(item.description)
                .multilineTextAlignment(.center)
                .font(.system(size: 16, weight: .regular, design: .default))
                .padding([.trailing, .leading], 24)
                .foregroundColor(Color.black)
        }
    }
}
