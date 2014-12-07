//  Copyright (c) 2014 Rob Rix. All rights reserved.

/// Returns a binary function which calls `f` with its arguments reversed.
///
/// I.e. `flip(f)(x, y)` is equivalent to `f(y, x)`
public func flip<T, U, V>(f: (T, U) -> V) -> (U, T) -> V {
	return { f($1, $0) }
}
