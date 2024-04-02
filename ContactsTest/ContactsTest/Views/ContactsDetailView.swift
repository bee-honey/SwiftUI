//
//  ContactsDetailView.swift
//  ContactsTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import SwiftUI

struct ContactsDetailView: View {
    let contact: Contact
    @EnvironmentObject var contactViewModel: ContactsViewModel
    var body: some View {
        VStack {
            AsyncImage(url: contact.contactImageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.gray, lineWidth: 2))
            } placeholder: {
                Circle()
                    .frame(width: 100, height: 100)
                    .background(Color.gray)
                    .clipShape(Circle())
            }
            Text(contact.name)
                .padding()
                .font(.largeTitle)
            Section {
                HStack {
                    Text("Email")
                        .padding(.leading)
                        .font(.headline)
                    Spacer()
                    Text(contact.email)
                        .padding(.trailing)
                }
            }
            .padding(.vertical, 10)
            .border(Color.gray.opacity(0.2))
            
            Section {
                HStack{
                    Text("Phone Number")
                        .padding(.leading)
                        .font(.headline)
                    Spacer()
                    Text(contact.phoneNumber)
                        .padding(.trailing)
                }
            }
            .padding(.vertical, 10)
            .border(Color.gray.opacity(0.2))
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
    }
}

#Preview {
    ContactsDetailView(contact: Contact.sample)
        .environmentObject(ContactsViewModel())
}
