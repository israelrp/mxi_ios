//
//  SegmentedCustom.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 27/01/26.
//

import Foundation
import SwiftUI

struct SegmentedCustom: View {
    
    let segments: [String]
    @Binding var currentPage: Int
    @Namespace private var name
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments.indices, id: \.self) { index in
                Button {
                    currentPage = index
                } label: {
                    VStack {
                        Text(segments[index])
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(Color.white)
                            //.foregroundStyle(currentPage == index ? .orange : Color(uiColor: .systemGray))
                        ZStack {
                            Capsule()
                                .fill(.clear)
                                .frame(height: 4)
                            if currentPage == index {
                                Capsule()
                                    .fill(Colors.white)
                                    .frame(width: 80, height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
        }
        .animation(.spring(duration: 0.3), value: currentPage)
    }
    
}
