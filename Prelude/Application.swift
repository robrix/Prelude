//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: Operators

infix operator |> {
	/// Associates to the left for consistency with F# and λ calculi.
	associativity left

	/// Minimal precedence means that everything else binds tighter.
	precedence 0
}

infix operator <| {
	/// Associates to the left for consistency with F# and λ calculi.
	associativity left

	/// Minimal precedence means that everything else binds tighter.
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
