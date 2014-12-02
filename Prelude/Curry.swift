//  Copyright (c) 2014 Rob Rix. All rights reserved.

/// Curries a binary function `f`, producing a function which can be partially applied.
public func curry<T, U, V>(f: (T, U) -> V) -> T -> U -> V {
	return { x in { y in f(x, y) }}
}
