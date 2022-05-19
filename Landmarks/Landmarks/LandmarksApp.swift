//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 정승균 on 2022/05/17.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
