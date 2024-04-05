//
//  SpotiCategoryCell.swift
//  Spoti
//
//  Created by Naveen Keerthy on 4/4/24.
//

import SwiftUI

struct SpotiCategoryCell: View {
    
    var title: String = "Music"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(isSelected ? .spotiGreen : .spotiGray)
            .foregroundStyle(isSelected ? .spotiBlack: .spotiWhite)
            .cornerRadius(16)
                
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotiCategoryCell(title: "All")
            SpotiCategoryCell(title: "Music", isSelected: true)
            SpotiCategoryCell(title: "Music", isSelected: false)
            
        }
        
        
        
    }
    
}
