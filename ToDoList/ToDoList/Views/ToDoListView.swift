//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Naveen Keerthy on 3/31/24.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    
    var body: some View {
        List {
            ForEach(itemViewModel.listItems) { listItem in
                ListRowView(listItem: listItem)
            }
//            .onDelete(perform: { indexSet in
//                listItems.remove(atOffsets: indexSet)
//            })
            .onDelete(perform: itemViewModel.deleteItem)
//            .onMove(perform: { indices, newOffset in
//                listItems.move(fromOffsets: indices, toOffset: newOffset)
//            })
            .onMove(perform: itemViewModel.moveItem)
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


#Preview {
    NavigationStack{
        ToDoListView()
    }
}
