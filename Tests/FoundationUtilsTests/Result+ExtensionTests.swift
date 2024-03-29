import XCTest
@testable import FoundationUtils

final class ResultExtensionTests: XCTestCase {
    func testMappingOverThrowingFunction() {
        let throwingTransform: (Int) throws -> String = { _ in throw TestError() }
        let mapped = Result<Int, Error>.success(123).map(throwingTransform)

        switch mapped {
        case .failure(let error as TestError):
            XCTAssertEqual(error, TestError())
        default:
            XCTFail()
        }
    }

    func testMappingOverNonThrowingFunction() {
        let throwingTransform: (Int) throws -> String = { intValue in return String(intValue) }
        let mapped = Result<Int, Error>.success(123).map(throwingTransform)

        switch mapped {
        case .success(let str):
            XCTAssertEqual(str, "123")
        case .failure:
            XCTFail()
        }
    }


    func testDefaultToValueReturnsValueIfSuccess() {
        let result = Result<String, Error>.success("abc")

        let defaultValue = result.default(to: "pqr")

        XCTAssertEqual(defaultValue, "abc")
    }

    func testDefaultToValueReturnsDefaultValueIfFailure() {
        let result = Result<String, Error>.failure(TestError())

        let defaultValue = result.default(to: "pqr")

        XCTAssertEqual(defaultValue, "pqr")
    }

    static var allTests = [
        ("testMappingOverThrowingFunction", testMappingOverThrowingFunction),
        ("testMappingOverNonThrowingFunction", testMappingOverNonThrowingFunction),
        ("testDefaultToValueReturnsValueIfSuccess", testDefaultToValueReturnsValueIfSuccess),
        ("testDefaultToValueReturnsDefaultValueIfFailure", testDefaultToValueReturnsDefaultValueIfFailure),
    ]
}

private struct TestError: Error, Equatable {
}
