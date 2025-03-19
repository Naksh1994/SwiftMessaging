//
//  FirestoreManager.swift
//  SwiftMessaging
//
//  Created by Nakshatra Verma on 19/03/25.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreManager: ObservableObject {
    private let db = Firestore.firestore()
    
    func sendMessage(_ message: Message) {
        do {
            _ = try db.collection("messages").addDocument(from: message)
        } catch {
            print("Error adding message: \(error)")
        }
    }
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        db.collection("messages")
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching messages: \(error)")
                    return
                }
                let messages = snapshot?.documents.compactMap { doc -> Message? in
                    try? doc.data(as: Message.self)
                } ?? []
                completion(messages)
            }
    }
}
