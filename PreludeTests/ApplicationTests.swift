//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class ApplicationTests: XCTestCase {

	// MARK: Forward function application

	func testForwardUnaryFunctionApplication() {
		let digits = 100 |> toString |> count
		XCTAssertEqual(digits, 3)
	}

	func testForwardBinaryFunctionApplication() {
		XCTAssertEqual((1, 2) |> (+), 3)
	}

	func testForwardPipelineWithMixedArity() {
		let digits = (75, 25) |> (+) |> toString |> count
		XCTAssertEqual(digits, 3)
	}

	func testForwardFunctionApplicationWithAssignment() {
		var digits = 0
		digits += 100 |> toString |> count
		XCTAssertEqual(digits, 3)
	}

	// MARK: Backward function application

	func testBackwardUnaryFunctionApplication() {
		let digits = count <| toString <| 100
		XCTAssertEqual(digits, 3)
	}

	func testBackwardBinaryFunctionApplication() {
		XCTAssertEqual((+) <| (1, 2), 3)
	}

	func testBackwardPipelineWithMixedArity() {
		let digits = count <| toString <| (+) <| (75, 25)
		XCTAssertEqual(digits, 3)
	}

	func testBackwardFunctionApplicationWithAssignment() {
		var digits = 0
		digits += count <| toString <| 100
		XCTAssertEqual(digits, 3)
	}

	func testBackwardPartialBinaryFunctionApplication() {
		let strings = (flip(map) <| toString) <| [1, 2, 3]
		XCTAssertEqual(strings, ["1", "2", "3"])
	}

	func testBackwardPartialTernaryFunctionApplication() {
		let sum: ([Int]) -> Int = (flip(reduce) <| (+)) <| 0
		XCTAssertEqual(sum([1, 2, 3]), 6)
	}
}


func toString<T>(x: T) -> String {
	return String(describing: x)
}

func count(string: String) -> Int {
	return string.characters.count
}

func map<S: Sequence, T>(sequence: S, _ transform: (S.Iterator.Element) -> T) -> [T] {
	return sequence.map(transform)
}

func reduce<S: Sequence, T>(sequence: S, initial: T, combine: (T, S.Iterator.Element) -> T) -> T {
	return sequence.reduce(initial, combine)
}
