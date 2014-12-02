//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class ComposeTests: XCTestCase {
	func testLeftToRightComposition() {
		XCTAssertEqual((countElements >>> toString)([4]), 3)
	}

	func testRightToLeftComposition() {
		XCTAssertEqual((toString <<< countElements)([4]), 3)
	}
}
