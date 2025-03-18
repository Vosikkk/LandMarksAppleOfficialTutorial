//
//  ContentView.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: _Tab = .featured
    
    enum _Tab {
        case featured
        case list
    }
   
    var body: some View {
        
        TabView(selection: $selection) {
            
            Tab("Featured", systemImage: "star", value: .featured) {
                CategoryHome()
            }
            Tab("List", systemImage: "list.bullet", value: .list) {
                LandmarkList()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
