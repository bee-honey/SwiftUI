//
//  ContentView.swift
//  SPMsandSDKs
//
//  Created by Naveen Keerthy on 3/31/24.
//

import SwiftUI
import SDWebImageSwiftUI


//https://picsum.photos/id/237/200/300
struct ContentView: View {
    var body: some View {
        WebImage(url: URL(string: "https://picsum.photos/id/237/200/300"))
    }
}

#Preview {
    ContentView()
}
