//
//  SwiftMessagingApp.swift
//  SwiftMessaging
//
//  Created by Nakshatra Verma on 19/03/25.
//


import SwiftUI
import Firebase

@main
struct SwiftMessagingApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

