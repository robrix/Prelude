//  Copyright (c) 2014 Rob Rix. All rights reserved.

infix operator .. {
	// Function composition is associative, but since we want to chain compositions, we pick right-associativity primarily for consistency with Haskell.
	associativity right

	// This is a higher precedence than the exponentiative operators `<<` and `>>`.
	precedence 170
}
