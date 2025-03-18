//
//  PageView.swift
//  LandMarks
//
//  Created by Саша Восколович on 18.03.2025.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    
    @State private var currentPage: Int = 0
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            PageViewController(pages: pages, currentPage: $currentPage)
               
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: controlWidth)
                .padding(.trailing)
            
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
    
    private var controlWidth: CGFloat {
        CGFloat(pages.count * 18)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0)} )
}
