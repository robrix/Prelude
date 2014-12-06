//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: Operators

infix operator |> {
	/// Associates to the left so that pipelines behave as expected.
	associativity left

	/// Minimal precedence.
	precedence 0
}

infix operator <| {
	/// Associates to the right so that pipelines behave as expected.
	associativity right

	/// Minimal precedence.
	precedence 0
}


// MARK: Function application

/// Forward unary function application.
///
/// Applies the function on the right to the value on the left.
public func |> <T, U> (left: T, right: T -> U) -> U {
	return right(left)
}

/// Backward unary function application.
///
/// Applies the function on the left to the value on the right.
public func <| <T, U> (left: T -> U, right: T) -> U {
	return left(right)
}
