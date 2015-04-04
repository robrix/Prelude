//  Copyright (c) 2015 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class FlurryTests: XCTestCase {
	func testFlurry() {
		XCTAssertEqual(map([1, 2, 3], 1 |> (-)~), [0, 1, 2])
	}
}

