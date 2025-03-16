//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

@main
struct LandMarksApp: App {
    
    @State private var modelData: ModelData = ModelData()
    
    var body: some Scene {
       
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
