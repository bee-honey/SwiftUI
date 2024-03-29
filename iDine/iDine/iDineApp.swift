//
//  iDineApp.swift
//  iDine
//
//  Created by Naveen Keerthy on 3/27/24.
//

import SwiftUI

@main
struct iDineApp: App {
//https://www.hackingwithswift.com/quick-start/swiftui/observable-objects-environment-objects-and-published
    @StateObject var order = Order()
    @StateObject var sampleEnv = SampleEnv()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(sampleEnv)
        }
    }
}
