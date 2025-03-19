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
            .frame(width: 700, height: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
