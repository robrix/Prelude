//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class ApplicationTests: XCTestCase {
	func testForwardApplication() {
		XCTAssertEqual(1 |> toString, "1")
	}

	func testBackwardApplication() {
		XCTAssertEqual(toStiring <1, "1")
	}
}
