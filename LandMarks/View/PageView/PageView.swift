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
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)
                .aspectRatio(3 / 2, contentMode: .fit)
                Text("Current Page: \(currentPage)")
        }
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0)} )
}
