//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class ComposeTests: XCTestCase {
	func testRightToLeftCompositionOfUnaryOnUnary() {
		let composed: ([Int]) -> Int = (count <<< toString)
		XCTAssertEqual(composed([4]), 3)
	}

	func testRightToLeftCompositionOfUnaryOnBinary() {
		let composed: (Int, Int) -> String = (toString <<< (+))
		XCTAssertEqual(composed(1, 2), "3")
	}

	func testRightToLeftCompositionOfBinaryOnUnary() {
		let composed: (Int, String) -> String = ((+) <<< toString)
		XCTAssertEqual(composed(1, "2"), "12")
	}

	func testLeftToRightCompositionOfUnaryOnUnary() {
		let composed: ([Int]) -> Int = (toString >>> count)
		XCTAssertEqual(composed([4]), 3)
	}

	func testLeftToRightCompositionOfUnaryOnBinary() {
		let composed: (Int, Int) -> String = ((+) >>> toString)
		XCTAssertEqual(composed(1, 2), "3")
	}

	func testLeftToRightCompositionOfBinaryOnUnary() {
		let composed: (Int, String) -> String = (toString >>> (+))
		XCTAssertEqual(composed(1, "2"), "12")
	}
}
