//
//  Contacts.swift
//  ContactsTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import Foundation

struct Contact: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phoneNumber: String
    let imageUrl: String
    
    var contactImageUrl: URL? {
        URL(string: imageUrl)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, email
        case phoneNumber = "phone_number"
        case imageUrl = "image_url"
    }
}

extension Contact {
    static var sample = Contact(id: 1, name: "Sample", email: "sample@email.com", phoneNumber: "000-000-00000", imageUrl: "https://avatars.githubusercontent.com/u/1?v=4")
}
