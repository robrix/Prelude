//  Copyright (c) 2014 Rob Rix. All rights reserved.

/// The identity function; returns its argument.
public func id<T>(x: T) -> T {
	return x
}


/// Returns a function which ignores its argument and returns `x` instead.
public func const<T, U>(x: T) -> U -> T {
	return { _ in x }
}


/// Returns a pair with its fields in the opposite order.
public func swap<A, B>(a: A, b: B) -> (B, A) {
	return (b, a)
}
