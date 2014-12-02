//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class ComposeTests: XCTestCase {
	func testCompose() {
		XCTAssertEqual((countElements .. toString)([4]), 3)
	}
}
