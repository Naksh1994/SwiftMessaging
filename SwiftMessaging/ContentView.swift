//
//  ContentView.swift
//  SwiftMessaging
//
//  Created by Nakshatra Verma on 19/03/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            ChatView()
        } else {
            LoginView()
        }
    }
}

