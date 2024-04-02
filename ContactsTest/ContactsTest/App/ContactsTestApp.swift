//
//  ContactsTestApp.swift
//  ContactsTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import SwiftUI

@main
struct ContactsTestApp: App {
    
    @StateObject var contactsViewModel = ContactsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContactsView()
                .environmentObject(contactsViewModel)
        }
    }
}
