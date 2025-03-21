//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Саша Восколович on 19.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        LandmarkList()
            .frame(minWidth: minWidth, minHeight: minHeight)
    }
    
    private let minWidth: CGFloat = 700
    private let minHeight: CGFloat = 300
}

#Preview {
    ContentView()
        .environment(ModelData())
}
