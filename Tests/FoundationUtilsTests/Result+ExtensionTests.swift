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

    static var allTests = [
        ("testMappingOverThrowingFunction", testMappingOverThrowingFunction),
        ("testMappingOverNonThrowingFunction", testMappingOverNonThrowingFunction),
    ]
}

private struct TestError: Error, Equatable {
}
