//
//  UnitUIDemoTests.swift
//  UnitUIDemoTests
//
//  Created by Theik Chan on 19/07/2022.
//

import XCTest
@testable import UnitUIDemo

class UnitUIDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func numberOfVowels(in string: String) -> Int {
        let vowels: [Character] = ["a","e","i","o","u",
        "A","E","I","O","U"]
        return string.reduce(0) {
            $0 + (vowels.contains($1) ? 1 : 0)
        }
    }
    
    func numberOfVowel(in string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u",
                                   "A", "E", "I", "O", "U"]
        var numberOfVowels = 0
        for character in string {
            if vowels.contains(character) {
                numberOfVowels += 1
            }
        }
        return numberOfVowels
    }
    
    func testNumberOfVowels() {
        let result = numberOfVowels(in: "Dominik")
        XCTAssertEqual(result,3, "Expected 3 vowels in 'Doninik' but got \(result)")
    }

    /// Custom Assert
    func DDHAssertEqual<A: Equatable, B: Equatable>(_ first: [A:B],_ second: [A:B],
                                                    file: StaticString = #filePath,
                                                    line: UInt = #line) {
        if first == second {
            return
        }
        for key in first.keys {
            if first[key] != second[key] {
                let value1 = String(describing: first[key]!)
                let value2 = String(describing: second[key]!)
                let keyValue1 = "\"\(key)\": \(value1)"
                let keyValue2 = "\"\(key)\": \(value2)"
                let message = "\(keyValue1) is not equal to \(keyValue2)"
                XCTFail(message,file: file, line: line)
                return
            }
        }
    }
    
    func test_dictsAreEqual() {
        let dict1 = ["id": "2", "name": "foo"]
        let dict2 = ["id": "2", "name": "foo"]
//        XCTAssertEqual(dict1, dict2)
        DDHAssertEqual(dict1, dict2)
        // Log output:
        // XCTAssertEqual failed: ("["name": "foo", "id":"2"]")...
        // ...is not equal to ("["name": "fo", "id": "2"]")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
//            numberOfVowel(in: "Dominik")
//            numberOfVowels(in: "Dominik")
        }
    }

}
