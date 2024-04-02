//
//  ItemViewModel.swift
//  ToDoList
//
//  Created by Naveen Keerthy on 3/31/24.
//

import Foundation

class ItemViewModel: ObservableObject {
    
    @Published var listItems = [ItemModel]()
    
    init() {
        self.getListItems()
    }
    
    func getListItems() {
        listItems = [
            ItemModel(title: "First", isCompleted: false),
            ItemModel(title: "Second", isCompleted: true),
            ItemModel(title: "Third", isCompleted: false)
        ]
    }
    
    func deleteItem(indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(indices: IndexSet, offset: Int) {
        listItems.move(fromOffsets: indices, toOffset: offset)
    }
    
}
