//
//  MenuNavigationView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 26/01/26.
//

import Foundation
import SwiftUI
import UIKit

struct MenuNavigationView: View {
    
    init() {
        
        let itemAppearance = UITabBarItemAppearance()
        
        //No seleccionado
        itemAppearance.normal.iconColor = UIColor(Colors.grayIcon)
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Colors.grayIcon)]
        
        //Seleccionado
        itemAppearance.selected.iconColor = UIColor(Colors.red)
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Colors.red)]
        
        let appeareance = UITabBarAppearance()
        appeareance.stackedLayoutAppearance = itemAppearance
        //TabBar background color
        appeareance.backgroundColor = UIColor(Colors.redNavigation)
        appeareance.shadowColor = UIColor(Colors.redNavigation)
        appeareance.stackedItemPositioning = .centered
        //The spacing between tabItems, but the biggest effect is that it is the same as the .fill format and will not exceed the view.
        appeareance.stackedItemSpacing = 2000
        
        //To apply all previous settings to the view
        //Using this will not apply our settings for UITabBarAppearance()
        UITabBar.appearance().standardAppearance = appeareance
        UITabBar.appearance().scrollEdgeAppearance = appeareance
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            TabView {
                //Reemplazar Text por el View
                Group {
                    
                    HomeView()
                        .tabItem {
                            Image("home")
                                .renderingMode(.template)
                            Text("Inicio")
                        }
                    MyearningsView()
                        .tabItem {
                            Image("money")
                                .renderingMode(.template)
                            Text("Mis ganancias")
                        }
                    MyAccountView()
                        .tabItem {
                            Image("usuario")
                                .renderingMode(.template)
                            Text("Mi cuenta")
                        }
                    
                }//End Group
                
            }//End TabView
            
        }//End ZStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.white)
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
    }//End body
    
}
