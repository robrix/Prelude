//  Copyright (c) 2015 Rob Rix. All rights reserved.

// MARK: - Optional conjunction

public func &&& <T, U> (left: T?, right: U?) -> (T, U)? {
	return left.map { x in right.map { y in (x, y) } } ?? nil
}


// MARK: - Operators

infix operator &&& {
	/// Same associativity as &&.
	associativity left

	/// Same precedence as &&.
	precedence 120
}
