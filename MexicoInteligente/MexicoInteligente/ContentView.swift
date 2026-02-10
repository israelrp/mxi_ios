//
//  ContentView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 22/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: BaseViewModel
    @EnvironmentObject var root : Navigation
    
    var body: some View {
        
        NavigationStack(path: $root.path) {
            
            Group {
            }//End Group
            .navigationDestination(for: Routes.self) { screen in
                switch screen {
                case .Onboarding:
                    OnboardingView()
                case .PhoneNumber:
                    PhoneNumberView()
                case .EnterCode:
                    EnterCodeView()
                case .MenuNavigation:
                    MenuNavigationView()
                case .Configuration:
                    ConfigurationView()
                case .EarningDetail(let step):
                    EarningDetailView(stepFromBack: step)
                case .BankDetails:
                    BankDetailsView()
                case .RealState:
                    RealStateView()
                case .TermsConditions:
                    TermsConditionsView()
                case .AdminTeam:
                    AdminTeamView()
                case .CreateAdvisor:
                    CreateAdvisorView()
                }
            }
            .onAppear() {
                if UserDefaultsPref.userId == 0 {
                    if UserDefaultsPref.hideOnboarding {
                        root.path.append(Routes.PhoneNumber)
                    } else {
                        root.path.append(Routes.Onboarding)
                    }
                    
                } else {
                    root.path.append(Routes.MenuNavigation)
                }
            }
        }//End NavigationStack
        
    }//End body
}
