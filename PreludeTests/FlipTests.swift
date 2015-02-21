//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class FlipTests: XCTestCase {
	func testFlip() {
		XCTAssertEqual(map([1, 2, 3], 1 |> curry(-)), [0, -1, -2])
		XCTAssertEqual(map([1, 2, 3], 1 |> curry(flip(-))), [0, 1, 2])
	}
}
