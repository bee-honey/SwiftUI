//
//  FruitsViewModel.swift
//  CoreDataTest
//
//  Created by Naveen Keerthy on 4/2/24.
//

import Foundation
import CoreData

class FruitsViewModel : ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description, error) in
            if let error {
                print("Error loading core data \(error)")
            } else {
                print("Success")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() -> Void {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
        }
    }
    
    func addFruits(fruitName: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = fruitName
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func updateFruit() {
        
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("error in saving data \(error)")
        }
    }
}
