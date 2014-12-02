//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class CurryTests: XCTestCase {
	func testBinaryCurrying() {
		let f: Int -> Int -> Bool = curry(==)
		XCTAssertTrue(f(0)(0))
		XCTAssertFalse(f(1)(0))
		XCTAssertTrue(f(1)(1))
		XCTAssertFalse(f(0)(1))
	}
}