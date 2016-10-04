//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: Operators

precedencegroup ForwardApplication {
	/// Associates to the left so that pipeline behaves as expected.
	associativity: left
	higherThan: AssignmentPrecedence
}

precedencegroup BackwardApplication {
	/// Associates to the right as `$` in Haskell.
	associativity: right
	higherThan: AssignmentPrecedence
}

infix operator |> : ForwardApplication
infix operator <| : BackwardApplication


// MARK: Forward function application

/// Forward function application.
///
/// Applies the function on the right to the value on the left. Functions of >1 argument can be applied by placing their arguments in a tuple on the left hand side.
///
/// This is a useful way of clarifying the flow of data through a series of functions. For example, you can use this to count the base-10 digits of an integer:
///
///		let digits = 100 |> toString |> count // => 3
public func |> <T, U> (left: T, right: (T) -> U) -> U {
	return right(left)
}


// MARK: Backward function application.

/// Backward function application.
///
/// Applies the function on the left to the value on the right. Functions of >1 argument can be applied by placing their arguments in a tuple on the right hand side.
public func <| <T, U> (left: (T) -> U, right: T) -> U {
	return left(right)
}

/// Backward binary function application.
///
/// Applies the function on the left to the value on the right, returning a unary function.
///
/// This is a useful way of partially applying a function in the manner of Haskell’s operator sections:
///
///		let incremented = map([1, 2, 3], (+) <| 1) // => [2, 3, 4]
public func <| <T, U, V> (left: @escaping (T, U) -> V, right: T) -> (U) -> V {
	return { left(right, $0) }
}

/// Backward ternary function application.
///
/// Applies the function on the left to the value on the right, returning a binary function.
public func <| <T, U, V, W> (left: @escaping (T, U, V) -> W, right: T) -> (U, V) -> W {
	return { left(right, $0, $1) }
}

/// Backward quaternary function application.
///
/// Applies the function on the left to the value on the right, returning a binary function.
public func <| <T, U, V, W, X> (left: @escaping (T, U, V, W) -> X, right: T) -> (U, V, W) -> X {
	return { left(right, $0, $1, $2) }
}
