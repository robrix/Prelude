//  Copyright (c) 2015 Rob Rix. All rights reserved.

// MARK: - Unit

/// Returns its argument as an `Optional<T>`.
public func unit<T>(x: T) -> T? {
	return x
}


// MARK: - Optional conjunction

/// Returns a tuple of two `Optional` values, or `nil` if either or both are `nil`.
public func &&& <T, U> (left: T?, @autoclosure right: () -> U?) -> (T, U)? {
	if let x = left, let y = right() {
		return (x, y)
	}
	return nil
}


// MARK: - Operators

infix operator &&& {
	/// Same associativity as &&.
	associativity left

	/// Same precedence as &&.
	precedence 120
}
