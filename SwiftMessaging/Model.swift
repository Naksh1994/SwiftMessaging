//
//  Model.swift
//  SwiftMessaging
//
//  Created by Nakshatra Verma on 19/03/25.
//

import Foundation
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable {
    @DocumentID var id: String?  // Firestore assigns the ID
    var text: String
    var senderID: String
    var timestamp: Date
}

