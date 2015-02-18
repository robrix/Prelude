//  Copyright (c) 2015 Rob Rix. All rights reserved.

// MARK: - Operators

infix operator &&& {
	/// Matches Haskell’s associativity.
	associativity right

	/// Same precedence as &&.
	precedence 120
}
