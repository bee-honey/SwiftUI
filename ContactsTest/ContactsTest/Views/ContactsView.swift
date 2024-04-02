//
//  ContentView.swift
//  ContactsTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import SwiftUI

struct ContactsView: View {

    @State private var searchQuery = ""
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    
    var filteredContacts: [Contact] {
        if searchQuery.isEmpty {
            return contactsViewModel.contacts
        } else {
            return contactsViewModel.contacts.filter { $0.name.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredContacts) { contact in
                    NavigationLink(value: contact) {
                        ContactRowView(contact: contact)
                    }
                }
                
//                ForEach(contactsViewModel.contacts){contact in
//                    NavigationLink(value: contact) {
//                        ContactRowView(contact: contact)
//                    }
//                }
            }
            .navigationDestination(for: Contact.self, destination: { contact in
                ContactsDetailView(contact: contact)
            })
            .searchable(text: $searchQuery)
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContactsView()
        .environmentObject(ContactsViewModel())
}
