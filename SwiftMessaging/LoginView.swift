//
//  LoginView.swift
//  SwiftMessaging
//
//  Created by Nakshatra Verma on 19/03/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                login()
            }
            .padding()
            
            Button("Sign Up") {
                signUp()
            }
            .padding()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
            }
        }
    }
}
