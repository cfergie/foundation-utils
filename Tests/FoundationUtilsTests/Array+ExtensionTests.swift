import XCTest
@testable import FoundationUtils

final class ArrayExtensionTests: XCTestCase {
    func testPrependingAnElemet() {
        XCTAssertEqual(
            ["x", "y", "z"].prepending("w"),
            ["w", "x", "y", "z"]
        )
    }

    func testAppendingAnElemet() {
        XCTAssertEqual(
            ["a", "b", "c", "d"].appending("e"),
            ["a", "b", "c", "d", "e"]
        )
    }

    static var allTests = [
        ("testPrependingAnElemet", testPrependingAnElemet),
        ("testAppendingAnElemet", testAppendingAnElemet),
    ]
}
