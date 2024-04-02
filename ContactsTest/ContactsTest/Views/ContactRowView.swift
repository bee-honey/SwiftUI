//
//  ContactRowView.swift
//  ContactsTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import SwiftUI

struct ContactRowView: View {
    
    let contact: Contact
    var body: some View {
        HStack {
            AsyncImage(url: contact.contactImageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.orange)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .frame(width: 32, height: 32)
                    .background(Color(.systemGray5))
            }
            Text(contact.name)
                .padding(.horizontal, 5)
            Spacer()
        }
//        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    ContactRowView(contact: Contact.sample)
}
