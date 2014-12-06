//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class ApplicationTests: XCTestCase {
	func testForwardApplication() {
		let digits = 100 |> toString |> countElements
		XCTAssertEqual(digits, 3)
	}

	func testBackwardApplication() {
		let digits = countElements <| toString <| 100
		XCTAssertEqual(digits, 3)
	}
}
