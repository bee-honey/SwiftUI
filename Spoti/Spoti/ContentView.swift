//
//  ContentView.swift
//  Spoti
//
//  Created by Naveen Keerthy on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(products) { product in
                        Text(product.title)
                            .foregroundStyle(.spotiGreen)
                    }
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
