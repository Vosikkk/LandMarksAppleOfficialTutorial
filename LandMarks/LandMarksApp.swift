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

#if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
#endif
        

#if os(watchOS)
        WKNotificationScene(
            controller: NotificationController.self,
            category: "LandmarkNear"
        )
#endif
    }
}
