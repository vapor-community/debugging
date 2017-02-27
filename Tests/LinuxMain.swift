import XCTest
@testable import DebuggingTests

XCTMain([
    testCase(FooErrorTests.allTests),
    testCase(GeneralTests.allTests),
])
