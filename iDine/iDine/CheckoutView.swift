//
//  CheckoutView.swift
//  iDine
//
//  Created by Naveen Keerthy on 3/28/24.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyID = ""
    
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var tipSelected = 10
    
    @State private var showPaymentAlert = false
    
    var totalAmount: String {
        let total = Double(order.total)
        let tipAmount = total / 100 * Double(tipSelected)
        return (total + tipAmount).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How would you like to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add Loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if (addLoyaltyDetails) {
                    TextField("Enter loyalty ID", text: $loyaltyID)
                }
            }
            
            Section("Add a tip") {
                Picker("Percentage", selection: $tipSelected) {
                    ForEach(tipPercentages, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total Amount is \(totalAmount)") {
                Button("Confirm Order") {
                    showPaymentAlert.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showPaymentAlert) {
            //add any action buttons
        } message: {
            Text("Your total was \(totalAmount), thank you!")
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
