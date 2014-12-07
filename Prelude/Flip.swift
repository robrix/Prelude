//  Copyright (c) 2014 Rob Rix. All rights reserved.

public func flip<T, U, V>(f: (T, U) -> V) -> (U, T) -> V {
	return { f($1, $0) }
}
