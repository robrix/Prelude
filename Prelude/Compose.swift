//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: - Operators

infix operator >>> {
	// Function composition is associative, but since we want to chain compositions, we pick right-associativity primarily for consistency with Haskell.
	associativity right

	// This is a higher precedence than the exponentiative operators `<<` and `>>`.
	precedence 170
}

infix operator <<< {
	// Function composition is associative, but since we want to chain compositions, we pick right-associativity primarily for consistency with Haskell.
	associativity right

	// This is a higher precedence than the exponentiative operators `<<` and `>>`.
	precedence 170
}


// MARK: - Right-to-left composition

/// Returns the right-to-left composition of unary `f` on unary `g`.
///
/// This is the function such that `(f <<< g)(x)` = `f(g(x))`.
public func <<< <T, U, V> (f: U -> V, g: T -> U) -> T -> V {
	return { f(g($0)) }
}

/// Returns the right-to-left composition of unary `f` on binary `g`.
///
/// This is the function such that `(f <<< g)(x, y)` = `f(g(x, y))`.
public func <<< <T, U, V, W> (f: V -> W, g: (T, U) -> V) -> (T, U) -> W {
	return { f(g($0, $1)) }
}

/// Returns the right-to-left composition of binary `f` on unary `g`.
///
/// This is the function such that `(f <<< g)(x, y)` = `f(g(x), y)`.
public func <<< <T, U, V, W> (f: (U, V) -> W, g: T -> U) -> (T, V) -> W {
	return { f(g($0), $1) }
}


// MARK: - Left-to-right composition

/// Returns the left-to-right composition of unary `g` on unary `f`.
///
/// This is the function such that `(f >>> g)(x)` = `g(f(x))`.
public func >>> <T, U, V> (f: T -> U, g: U -> V) -> T -> V {
	return { g(f($0)) }
}

/// Returns the left-to-right composition of unary `g` on binary `f`.
///
/// This is the function such that `(f >>> g)(x, y)` = `g(f(x, y))`.
public func >>> <T, U, V, W> (f: (T, U) -> V, g: V -> W) -> (T, U) -> W {
	return { g(f($0, $1)) }
}

/// Returns the left-to-right composition of binary `g` on unary `f`.
///
/// This is the function such that `(f >>> g)(x, y)` = `g(f(x), y)`.
public func >>> <T, U, V, W> (f: T -> U, g: (U, V) -> W) -> (T, V) -> W {
	return { g(f($0), $1) }
}
