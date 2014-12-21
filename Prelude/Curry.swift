//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: - Currying

/// Curries a binary function `f`, producing a function which can be partially applied.
public func curry<T, U, V>(f: (T, U) -> V) -> T -> U -> V {
	return { x in { f(x, $0) } }
}

/// Curries a ternary function `f`, producing a function which can be partially applied.
public func curry<T, U, V, W>(f: (T, U, V) -> W) -> T -> U -> V -> W {
	return { x in curry { f(x, $0, $1) } }
}


// MARK: - Uncurrying

/// Uncurries a curried binary function `f`, producing a function which can be applied to a tuple.
public func uncurry<T, U, V>(f: T -> U -> V) -> (T, U) -> V {
	return { f($0)($1) }
}

/// Uncurries a curried ternary function `f`, producing a function which can be applied to a tuple.
public func uncurry<T, U, V, W>(f: T -> U -> V -> W) -> (T, U, V) -> W {
	return { f($0)($1)($2) }
}
