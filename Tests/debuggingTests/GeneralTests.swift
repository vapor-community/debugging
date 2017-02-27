import XCTest
@testable import Debugging

class GeneralTests: XCTestCase {
    static let allTests = [
        ("testDescription", testDescription),
        ("testBulletedList", testBulletedList),
        ("testReadableName", testReadableName),
        ("testReadableNameEdgeCase", testReadableNameEdgeCase),
        ("testMinimum", testMinimum),
    ]

    func testDescription() {
        let error = FooError.noFoo
        var expectation = "Foo Error: You do not have a `foo`.\n\n"
        expectation += "Identifier: DebuggingTests.FooError.noFoo\n\n"

        expectation += "Here are some possible causes: \n"
        expectation += "- You did not set the flongwaffle.\n"
        expectation += "- The session ended before a `Foo` could be made.\n"
        expectation += "- The universe conspires against us all.\n"
        expectation += "- Computers are hard.\n\n"

        expectation += "These suggestions could address the issue: \n"
        expectation += "- You really want to use a `Bar` here.\n"
        expectation += "- Take up the guitar and move to the beach.\n\n"

        expectation += "Vapor's documentation talks about this: \n"
        expectation += "- http://documentation.com/Foo\n"
        expectation += "- http://documentation.com/foo/noFoo"

        XCTAssertEqual(error.debugDescription, expectation)
    }

    func testBulletedList() {
        let todos = [
            "Get groceries",
            "Walk the dog",
            "Change oil in car",
            "Get haircut"
        ]

        let bulleted = todos.bulletedList
        let expectation = "\n- Get groceries\n- Walk the dog\n- Change oil in car\n- Get haircut"
        XCTAssertEqual(bulleted, expectation)
    }

    func testReadableName() {
        let typeName = "SomeRandomModule.MyType.Error"
        let readableName = typeName.readableTypeName()
        let expectation = "My Type Error"
        XCTAssertEqual(readableName, expectation)
    }

    func testReadableNameEdgeCase() {
        let edgeCases = [
            "SomeModule.": "",
            "SomeModule.S": "S"
        ]
        edgeCases.forEach { edgeCase, expectation in
            let readableName = edgeCase.readableTypeName()
            XCTAssertEqual(readableName, expectation)
        }
    }

    func testMinimum() {
        let minimum = MinimumError.alpha
        let description = minimum.debugDescription
        let expectation = "Minimum Error: Not enabled\n\nIdentifier: DebuggingTests.MinimumError.alpha"
        XCTAssertEqual(description, expectation)
    }
}
