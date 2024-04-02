//
//  CoreDataTestTests.swift
//  CoreDataTestTests
//
//  Created by Naveen Keerthy on 4/2/24.
//

import XCTest
import CoreData
@testable import CoreDataTest

class MockPersistentContainer: NSPersistentContainer {
    override init(name: String, managedObjectModel model: NSManagedObjectModel) {
        super.init(name: name, managedObjectModel: model)
        self.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
    }
}

final class CoreDataTestTests: XCTestCase {
    
    var sut: FruitsViewModel!
    var mockPersistentContainer: NSPersistentContainer!

    override func setUpWithError() throws {
        super.setUp()
        let modelURL = Bundle(for: type(of: self)).url(forResource: "FruitsViewModel", withExtension: "xcdatamodeld")!
        let mom = NSManagedObjectModel(contentsOf: modelURL)!
        mockPersistentContainer = MockPersistentContainer(name: "TestContainer", managedObjectModel: mom)
                
        sut = FruitsViewModel(container: mockPersistentContainer)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockPersistentContainer = nil
        super.tearDown()
    }

    func testExample() throws {
        let fruitName = "Apple"
        sut.addFruits(fruitName: fruitName)
        
        // Fetch fruits to validate
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        let results = try! mockPersistentContainer.viewContext.fetch(request)
        
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.name, fruitName)
    }


}
