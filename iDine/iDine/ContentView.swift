//
//  ContentView.swift
//  iDine
//
//  Created by Naveen Keerthy on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationStack{
            List{
                ForEach(menu){ section in
                    Section(section.name){
                        ForEach(section.items) { item in
                            
//This flows performance is not good as it create Navigation link and ItemDeail for every item
//                            NavigationLink {
//                                ItemDetail(item: item)
//                            } label: {
//                                ItemRow(item: item)
//                            }
                            
                            
//Instead SUI is providing this simple solution
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
//              https://www.hackingwithswift.com/quick-start/swiftui/displaying-a-detail-screen-with-navigationlink
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}
