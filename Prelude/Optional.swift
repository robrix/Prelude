//  Copyright (c) 2015 Rob Rix. All rights reserved.

// MARK: - Optional conjunction

/// Returns a tuple of two `Optional` values, or `nil` if either or both are `nil`.
public func &&& <T, U> (left: T?, right: @autoclosure () -> U?) -> (T, U)? {
	if let x = left, let y = right() {
		return (x, y)
	}
	return nil
}


// MARK: - Operators

/// Same associativity and precedence as &&.
infix operator &&& : LogicalConjunctionPrecedence
