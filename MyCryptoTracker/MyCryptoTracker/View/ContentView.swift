//
//  ContentView.swift
//  MyCryptoTracker
//
//  Created by Naveen Keerthy on 3/30/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var showErrorAlert = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    CoinRowView(coin: coin)
                }
            }
            .refreshable {
                viewModel.handleRefresh()
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showErrorAlert.toggle()
                }
            })
            .alert("Error", isPresented: $showErrorAlert, actions: {
                //Add any buttons here
            }, message: {
                Text(viewModel.error?.localizedDescription ?? "")
            })
            
            .navigationTitle("Live Prices")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
