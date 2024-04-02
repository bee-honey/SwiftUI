//
//  ListRowView.swift
//  ToDoList
//
//  Created by Naveen Keerthy on 3/31/24.
//

import SwiftUI

struct ListRowView: View {
    var listItem: ItemModel = ItemModel(title: "", isCompleted: false)
    var body: some View {
        HStack {
            Image(systemName: listItem.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(listItem.isCompleted ? Color.green : Color.red)
            Text(listItem.title)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack{
        Group{
            ListRowView(listItem: ItemModel(title: "Sample1", isCompleted: true))
        }
        
    }
}

// Correct way to define a preview
//struct ListRowView_Previews: PreviewProvider {
//    static let item1 = ItemModel(title: "Sample1", isCompleted: true)
//    static let item2 = ItemModel(title: "Sample2", isCompleted: false)
//
//    static var previews: some View {
//        Group {
//            ListRowView(listItem: item1)
//            ListRowView(listItem: item2)
//        }
//        .previewLayout(.sizeThatFits)
//    }
//    
//}
