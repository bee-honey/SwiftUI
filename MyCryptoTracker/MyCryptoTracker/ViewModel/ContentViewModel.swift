//
//  ContentViewModel.swift
//  MyCryptoTracker
//
//  Created by Naveen Keerthy on 3/30/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var error: Error?
    @Published var coins = [Coin]()
    
    let BASE_URL = "https://api.coingecko.com/api/v3/coins/"
    
    var urlString: String {
        return  "\(BASE_URL)markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&price_change_percentage=24h"
    }
    
    init() {
        loadData()
    }
    
    func handleRefresh() {
        coins.removeAll()
        loadData()
    }
}
// MARK: Async/Await

extension ContentViewModel {
    @MainActor
    func fetchCoinsWithAsync() async throws {
        do {
            guard let url = URL(string: urlString) else { throw CoinError.invalidURL}
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw CoinError.serverError}
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {throw CoinError.invalidData}
            self.coins = coins
        } catch {
            //The error variable available in the catch block represents whichever error was thrown from the do block
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchCoinsWithAsync()
        }
    }
}

// MARK: - URLSession

extension ContentViewModel {
    func fetchCoinsWithURLSession() {
//        let time = DispatchTime.now()
        guard let url = URL(string: urlString) else {
            print("DEBUG: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let error {
                    print("DEBUG: Error \(error)")
                    return
                }
                
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    print("DEBUG: Server error")
                    return
                }
                
                guard let data else {
                    print("DEBUG: Invalid Data")
                    return
                }
                
                
                
                guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
                    print("DEBUG: Invalid data")
                    return
                }
                
                print(coins)
                
                self.coins = coins
            }
        }.resume()
    }
}
