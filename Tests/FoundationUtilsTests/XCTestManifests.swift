import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(foundation_utilsTests.allTests),
    ]
}
#endif
