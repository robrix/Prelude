//  Copyright (c) 2014 Rob Rix. All rights reserved.

import Prelude
import XCTest

final class FixTests: XCTestCase {
	func testFixpointOfFactorial() {
		let factorial = fix { recur in
			{ n in n > 0 ? n * recur(n - 1) : 1 }
		}
		XCTAssertEqual(factorial(5), 120)
	}

	func testFixpointOfFibonacciSeries() {
		// Swift forbids recursive typealiases, so we use a struct instead of a tuple.
		struct Fibonacci {
			let value: Int
			let next: () -> Fibonacci
		}
		let fibonacci: (Int, Int) -> Fibonacci = fix { (recur: @escaping (Int, Int) -> Fibonacci) in
			{ x, y in Fibonacci(value: x + y, next: { recur(y, x + y) }) }
		}
		XCTAssertEqual(fibonacci(0, 1).value, 1)
		XCTAssertEqual(fibonacci(0, 1).next().value, 2)
		XCTAssertEqual(fibonacci(0, 1).next().next().value, 3)
		XCTAssertEqual(fibonacci(0, 1).next().next().next().value, 5)
		XCTAssertEqual(fibonacci(0, 1).next().next().next().next().value, 8)
		XCTAssertEqual(fibonacci(0, 1).next().next().next().next().next().value, 13)
	}
}
