import XCTest
@testable import FoundationUtils

final class ArrayExtensionTests: XCTestCase {
    func testAppendingAnElemet() {
        XCTAssertEqual(
            ["a", "b", "c", "d"].appending("e"),
            ["a", "b", "c", "d", "e"]
        )
    }
}
