import XCTest
@testable import FoundationUtils

final class ThrowableTests: XCTestCase {
    func testDecodingSuccess() {
        struct S: Decodable, Equatable {
            let p: String
        }

        let data = """
        {
            "p": "abc"
        }
        """.data(using: .utf8)!

        let throwable = try! JSONDecoder().decode(Throwable<S>.self, from: data)

        switch throwable.result {
        case .success(let s):
            XCTAssertEqual(s, S(p: "abc"))
        case .failure:
            XCTFail()
        }
    }

    func testDecodingFailure() {
        struct S: Decodable, Equatable {
            let p: String
        }

        let data = """
        {
            "p": 123
        }
        """.data(using: .utf8)!

        let throwable = try! JSONDecoder().decode(Throwable<S>.self, from: data)

        switch throwable.result {
        case .success:
            XCTFail()
        case .failure(let error):
            XCTAssertNotNil(error)
        }
    }

    static var allTests = [
        ("testDecodingSuccess", testDecodingSuccess),
        ("testDecodingFailure", testDecodingFailure),
    ]
}
