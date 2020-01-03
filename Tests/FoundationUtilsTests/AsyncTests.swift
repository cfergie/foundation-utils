import XCTest
@testable import FoundationUtils

final class AsyncTests: XCTestCase {
    func testEquatable() {
        XCTAssertEqual(Async<String>.initial, Async<String>.initial)
        XCTAssertEqual(Async<Int>.loading, Async<Int>.loading)
        XCTAssertEqual(Async.loaded("abc"), Async.loaded("abc"))
        XCTAssertNotEqual(Async<Int>.initial, Async<Int>.loading)
        XCTAssertNotEqual(Async<Float>.initial, Async<Float>.loaded(123))
        XCTAssertNotEqual(Async.loaded(123), Async.loaded(456))
    }

    static var allTests = [
        ("testEquatable", testEquatable),
    ]
}
