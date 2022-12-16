//
//  LiSIGNUITests.swift
//  LiSIGNUITests
//

import XCTest
import FirebaseDatabase

class LiSIGNUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testRetrievingDataFromFirebase() {
        let firebaseRef = Database.database().reference()
        let expectation = self.expectation(description: "Data should be retrieved from Firebase")

        firebaseRef.child("productsList").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            XCTAssertNotNil(value, "Data should not be nil")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testAddingDataToFirebase() {
        let firebaseRef = Database.database().reference()
        let expectation = self.expectation(description: "Data should be added to Firebase")

        let testData = [
            Product(name: "pony", description: "This is just a description", info: "information about the product")
        ]
        firebaseRef.child("productsList").setValue(testData) { (error, ref) in
            XCTAssertNil(error, "Error should be nil")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
