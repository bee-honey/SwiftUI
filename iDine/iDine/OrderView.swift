//
//  OrderView.swift
//  iDine
//
//  Created by Naveen Keerthy on 3/28/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List{
                Section {
                        ForEach(order.items) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("$\(item.price)")
                            }
                        }
                        .onDelete(perform: { indexSet in
                            deleteItem(at: indexSet)
                        })
                }
                Section {
                    NavigationLink("Place order"){
                        CheckoutView()
                    }
                    .disabled(order.items.isEmpty)
                }
            }
            
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                EditButton()
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
