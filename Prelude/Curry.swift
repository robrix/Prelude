//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: - Currying

/// Curries a binary function `f`, producing a function which can be partially applied.
public func curry<T, U, V>(f: (T, U) -> V) -> T -> U -> V {
	return { x in { y in f(x, y) }}
}


// MARK: - Uncurrying

/// Uncurries a curried binary function `f`, producing a function which takes receives its arguments as a tuple.
public func uncurry<T, U, V>(f: T -> U -> V) -> (T, U) -> V {
	return { f($0)($1) }
}
