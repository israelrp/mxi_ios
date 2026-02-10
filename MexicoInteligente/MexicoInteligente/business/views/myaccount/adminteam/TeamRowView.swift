//
//  TeamRowView.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 03/02/26.
//

import Foundation
import SwiftUI

struct TeamRowView: View {
    
    @EnvironmentObject var root : Navigation
    var team: TeamItem
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("\(team.name) \(team.isAsesor ? " (Admin.)" : "")" )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundColor(Colors.redTitles)
                    .padding(.top, 8)
                    .padding([.leading, .trailing], 16)
                
                Spacer()
                
                Text("Editar")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 12, weight: .semibold, design: .default))
                    .padding(.bottom, 4)
                    .foregroundStyle(Colors.redTitles)
                    .underline()
                    .padding(.top, 12)
                    .padding([.leading, .trailing], 16)
            }
            .frame(maxWidth: .infinity)
            
            Text("\(team.cel)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(Color.black)
                .padding(.top, 2)
                .padding([.leading, .trailing], 16)
            
            Text("\(team.date)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(Colors.graySms)
                .padding(.top, 2)
                .padding(.bottom, 8)
                .padding([.leading, .trailing], 16)
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), radius: 4, x: 1, y: 1)
        .padding([.top, .bottom], 4)
        
    }//End body
    
}
