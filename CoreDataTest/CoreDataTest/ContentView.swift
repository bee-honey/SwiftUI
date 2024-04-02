//
//  ContentView.swift
//  CoreDataTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = FruitsViewModel()
    @State private var textFieldText: String = ""
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Add fruit here", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                Button {
                    guard !textFieldText.isEmpty else {return}
                    vm.addFruits(fruitName: textFieldText)
                    textFieldText = ""
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No Name")
                            .onTapGesture {
                                vm.updateFruit()
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    ContentView()
}
