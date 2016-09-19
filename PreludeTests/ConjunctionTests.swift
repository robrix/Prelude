//  Copyright (c) 2015 Rob Rix. All rights reserved.

final class ConjunctionTests: XCTestCase {
	func testPairsNonNilOperands() {
		let left: Int? = 0
		let right: String? = ""
		let and = left &&& right
		XCTAssert(and?.0 == 0)
		XCTAssert(and?.1 == "")
	}

	func testDropsBothOperandsIfEitherIsNil() {
		XCTAssert(((nil as Int?) &&& 1) == nil)
		XCTAssert((1 &&& (nil as Int?)) == nil)
		XCTAssert(((nil as Int?) &&& (nil as Int?)) == nil)
	}

	func testShortCircuits() {
		var effects = 0
		let left: Int? = nil
		let right = { effects += 1 }
		XCTAssert((left &&& right()).map(const(true)) == nil)
		XCTAssertEqual(effects, 0)
	}
}


// MARK: - Imports

import Prelude
import XCTest
