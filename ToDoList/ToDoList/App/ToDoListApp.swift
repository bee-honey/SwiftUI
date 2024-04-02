//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Naveen Keerthy on 3/31/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var itemViewModel = ItemViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ToDoListView()
                    .environmentObject(itemViewModel)
            }
        }
    }
}
