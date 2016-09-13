//  Copyright (c) 2014 Rob Rix. All rights reserved.

/// The identity function; returns its argument.
public func id<T>(_ x: T) -> T {
	return x
}


/// Returns a function which ignores its argument and returns `x` instead.
public func const<T, U>(_ x: T) -> (U) -> T {
	return { _ in x }
}


/// Returns a pair with its fields in the opposite order.
public func swap<A, B>(_ a: A, _ b: B) -> (B, A) {
	return (b, a)
}
