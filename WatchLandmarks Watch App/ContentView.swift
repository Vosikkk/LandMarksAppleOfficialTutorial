//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Саша Восколович on 19.03.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
