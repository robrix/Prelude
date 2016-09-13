//  Copyright (c) 2014 Rob Rix. All rights reserved.

/// Returns a binary function which calls `f` with its arguments reversed.
///
/// I.e. `flip(f)(x, y)` is equivalent to `f(y, x)`.
public func flip<T, U, V>(_ f: @escaping (T, U) -> V) -> (U, T) -> V {
	return { f($1, $0) }
}

/// Returns a ternary function which calls `f` with its arguments reversed.
///
/// I.e. `flip(f)(x, y, z)` is equivalent to `f(z, y, x)`.
public func flip<T, U, V, W>(_ f: @escaping (T, U, V) -> W) -> (V, U, T) -> W {
	return { f($2, $1, $0) }
}

/// Returns a quaternary function which calls `f` with its arguments reversed.
///
/// I.e. `flip(f)(w, x, y, z)` is equivalent to `f(z, y, x, w)`.
public func flip<T, U, V, W, X>(_ f: @escaping (T, U, V, W) -> X) -> (W, V, U, T) -> X {
	return { f($3, $2, $1, $0) }
}
