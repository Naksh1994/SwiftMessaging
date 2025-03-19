//
//  ChatView.swift
//  SwiftMessaging
//
//  Created by Nakshatra Verma on 19/03/25.
//

import SwiftUI
import FirebaseAuth

struct ChatView: View {
    @State private var messages: [Message] = []
    @State private var messageText: String = ""
    @ObservedObject var firestoreManager = FirestoreManager()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(messages) { message in
                        Text(message.text)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .onAppear {
                firestoreManager.fetchMessages { newMessages in
                    messages = newMessages
                }
            }
            
            HStack {
                TextField("Enter message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .padding()
                }
            }
            .padding()
        }
    }
    
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        let newMessage = Message(
            text: messageText,
            senderID: Auth.auth().currentUser?.uid ?? "unknown",
            timestamp: Date()
        )
        
        firestoreManager.sendMessage(newMessage)
        messageText = ""
    }
}
