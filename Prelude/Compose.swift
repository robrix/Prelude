//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: - Operator

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


// MARK: - Composition

/// Returns the left-to-right composition of f on g.
///
/// This is the function such that `(f .. g)(x)` = `f(g(x))`.
public func >>> <T, U, V> (f: U -> V, g: T -> U) -> T -> V {
	return { f(g($0)) }
}

/// Returns the right-to-left composition of g on f.
///
/// This is the function such that `(f .. g)(x)` = `g(f(x))`.
public func <<< <T, U, V> (f: T -> U, g: U -> V) -> T -> V {
	return { g(f($0)) }
}
