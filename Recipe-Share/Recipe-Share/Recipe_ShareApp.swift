//
//  Recipe_ShareApp.swift
//  Recipe-Share
//
//  Created by COCOMPBSC23.1p-030 on 2024-09-28.
//

import SwiftUI
import FirebaseCore

@main
struct Recipe_ShareApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
