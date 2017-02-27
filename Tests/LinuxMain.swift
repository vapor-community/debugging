import XCTest
@testable import debuggingTests

XCTMain([
    testCase(FooErrorTests.allTests),
    testCase(GeneralTests.allTests),
])
