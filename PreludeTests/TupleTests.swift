//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class testTupleExtracts: XCTestCase {
    func testExtracts() {
        XCTAssertEqual(first((0, 1)), 0)
        XCTAssertEqual(second((0, 1)), 1)
    }
}
