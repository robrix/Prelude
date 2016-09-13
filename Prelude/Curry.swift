//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: - Currying

/// Curries a binary function `f`, producing a function which can be partially applied.
public func curry<T, U, V>(_ f: @escaping (T, U) -> V) -> (T) -> (U) -> V {
	return { x in { f(x, $0) } }
}

/// Curries a ternary function `f`, producing a function which can be partially applied.
public func curry<T, U, V, W>(_ f: @escaping (T, U, V) -> W) -> (T) -> (U) -> (V) -> W {
	return { x in curry { f(x, $0, $1) } }
}

/// Curries a quaternary function, `f`, producing a function which can be partially applied.
public func curry<T, U, V, W, X>(_ f: @escaping (T, U, V, W) -> X) -> (T) -> (U) -> (V) -> (W) -> X {
	return { x in curry { f(x, $0, $1, $2) } }
}


// MARK: - Uncurrying

/// Uncurries a curried binary function `f`, producing a function which can be applied to a tuple.
public func uncurry<T, U, V>(_ f: @escaping (T) -> (U) -> V) -> (T, U) -> V {
	return { f($0)($1) }
}

/// Uncurries a curried ternary function `f`, producing a function which can be applied to a tuple.
public func uncurry<T, U, V, W>(_ f: @escaping (T) -> (U) -> (V) -> W) -> (T, U, V) -> W {
	return { f($0)($1)($2) }
}

/// Uncurries a curried quaternary function `f`, producing a function which can be applied to a tuple.
public func uncurry<T, U, V, W, X>(_ f: @escaping (T) -> (U) -> (V) -> (W) -> X) -> (T, U, V, W) -> X {
	return { f($0)($1)($2)($3) }
}
