import XCTest
@testable import Debugging

class DebuggingTests: XCTestCase {
    func testBasic() {
        let error = FooError.noFoo

        print(error)
    }
}
