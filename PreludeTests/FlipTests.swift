//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class FlipTests: XCTestCase {
	func testFlip() {
		XCTAssertEqual([1, 2, 3].map(1 |> curry(-)), [0, -1, -2])
		XCTAssertEqual([1, 2, 3].map(1 |> curry(flip(-))), [0, 1, 2])
	}
}
