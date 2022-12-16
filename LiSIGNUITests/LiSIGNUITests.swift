//
//  LiSIGNUITests.swift
//  LiSIGNUITests
//
//  Created by Lenka Orinčáková on 9/27/22.
//

import XCTest
//import FirebaseCore
//import FirebaseDatabase

class LiSIGNUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            print("HEREEEEEEEEEE")
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
//    func testRetrievingDataFromFirebase() {
//        let firebaseRef = Database.database().reference()
//        let expectation = self.expectation(description: "Data should be retrieved from Firebase")
//
//        firebaseRef.child("productsList").observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            XCTAssertNotNil(value, "Data should not be nil")
//            expectation.fulfill()
//        })
//
//        waitForExpectations(timeout: 5, handler: nil)
//    }
//
//    func testAddingDataToFirebase() {
//        let firebaseRef = Database.database().reference()
//        let expectation = self.expectation(description: "Data should be added to Firebase")
//
//        let testData = ["name": "John Doe", "age": 32]
//        firebaseRef.child("test_data").setValue(testData) { (error, ref) in
//            XCTAssertNil(error, "Error should be nil")
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: 5, handler: nil)
//    }
}
