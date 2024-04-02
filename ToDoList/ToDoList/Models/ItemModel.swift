//
//  ItemModel.swift
//  ToDoList
//
//  Created by Naveen Keerthy on 3/31/24.
//

import Foundation

struct ItemModel : Identifiable {
    let id: String = UUID().uuidString //Better to use it as a string, easy for migrating to 3rd party DB
    let title: String
    let isCompleted: Bool
}
