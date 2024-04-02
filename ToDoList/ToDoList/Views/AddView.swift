//
//  AddTodoItem.swift
//  ToDoList
//
//  Created by Naveen Keerthy on 3/31/24.
//

import SwiftUI

struct AddView: View {
    @State private var addItem: String = ""
    var body: some View {
        ScrollView{
            
            TextField("Add Item", text: $addItem)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.gray).opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
           
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            
        }
        .padding(14)
        .navigationTitle("Add Item 🖊️")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    
}
