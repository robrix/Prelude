//  Copyright (c) 2015 Rob Rix. All rights reserved.

// MARK: - Operator

postfix operator ~ {}

postfix public func ~ <T, U, V> (function: (T, U) -> V) -> U -> T -> V {
	return curry(flip(function))
}

postfix public func ~ <T, U, V, W> (function: (T, U, V) -> W) -> V -> U -> T -> W {
	return curry(flip(function))
}

