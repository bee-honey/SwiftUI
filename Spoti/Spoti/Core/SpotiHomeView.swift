//
//  SpotiHomeView.swift
//  Spoti
//
//  Created by Naveen Keerthy on 4/4/24.
//

import SwiftUI

struct SpotiHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var categorySelected: Category? = nil
    
    var body: some View {
        ZStack {
            Color.spotiBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section{
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        header
                    }
                }
                .padding(.top, 8)
                
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
//            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack (spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotiWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotiCategoryCell(title: category.rawValue.capitalized, isSelected: categorySelected == category)
                            .onTapGesture {
                                categorySelected = category
                            }
                    }
                    
                    
                }
                .padding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotiBlack)
    }
}



#Preview {
    SpotiHomeView()
}
