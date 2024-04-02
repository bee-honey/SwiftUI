//
//  ContactsViewModel.swift
//  ContactsTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import Foundation

class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    init() {
        loadData()
    }
    
    private func loadData() -> Void {
        contacts = Bundle.main.decode([Contact].self, from: "ContactsJSON.json")
    }
}
