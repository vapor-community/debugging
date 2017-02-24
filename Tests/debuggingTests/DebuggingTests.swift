import XCTest
@testable import Debugging

class DebuggingTests: XCTestCase {
    
    var error: FooError!
    
    override func setUp() {
        super.setUp()
        
        error = .noFoo
    }
    
    func testPrintLogsDebugDescription() {
        print(error)
        
        XCTAssertEqual(error.debugDescription,
                       expectedPrintable,
                       "`error`'s `debugDescription` should equal `expectedPrintable`.")
    }
    
    func testThatDebugDescriptionDoesNotContainMEmptyField() {
        XCTAssertTrue(error.stackOverflowQuestions.isEmpty, "There should be no `stackOverflowQuestions`.")
        
        XCTAssertFalse(error.debugDescription.contains("Stack Overflow"), "The `debugDescription` should contain no mention of Stack Overflow.")
    }
    
    func testThatReadableNameIsWellFormattedString() {
        XCTAssertEqual(FooError.readableName,
                       "Foo Error",
                       "`readableName` should be a well-formatted `String`.")
    }
    
    func testThatInstanceIdentifierYieldsStringDescriptionOfInstance() {
        XCTAssertEqual(error.instanceIdentifier,
                       "noFoo",
                       "`instanceIdentifier` should equal `'noFoo'`.")
    }
    
    func testThatCausesSuggestionsAndResourcesMatchExpectations() {
        XCTAssertEqual(error.possibleCauses,
                       expectedPossibleCauses,
                       "`possibleCauses` should match `expectedPossibleCauses`")
        
        XCTAssertEqual(error.suggestedFixes,
                       expectedSuggestedFixes,
                       "`suggestedFixes` should match `expectedSuggestFixes`")
        
        XCTAssertEqual(error.documentationLinks,
                       expectedDocumentedLinks,
                       "`documentationLinks` should match `expectedDocumentedLinks`")
    }
}

// MARK: - Fixtures

private let expectedPrintable = "Foo Error: You do not have a `foo`.\n\nIdentifier: debuggingTests.FooError.noFoo\n\nHere are some possible causes: \n- You did not set the flongwaffle.\n- The session ended before a `Foo` could be made.\n- The universe conspires against us all.\n- Computers are hard.\n\nThese suggestions could address the issue: \n- You really want to use a `Bar` here.\n- Take up the guitar and move to the beach.\n\nVapor\'s documentation talks about this: \n- http://documentation.com/Foo\n- http://documentation.com/foo/noFoo"

private let expectedPossibleCauses = [
    "You did not set the flongwaffle.",
    "The session ended before a `Foo` could be made.",
    "The universe conspires against us all.",
    "Computers are hard."
]

private let expectedSuggestedFixes = [
    "You really want to use a `Bar` here.",
    "Take up the guitar and move to the beach."
]

private let expectedDocumentedLinks = [
    "http://documentation.com/Foo",
    "http://documentation.com/foo/noFoo"
]
