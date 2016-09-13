//  Copyright (c) 2014 Rob Rix. All rights reserved.

/// Returns the least fixed point of the function returned by `f`.
///
/// This is useful for e.g. making recursive closures without using the two-step assignment dance.
///
/// \param f  - A function which takes a parameter function, and returns a result function. The result function may recur by calling the parameter function.
///
/// \return  A recursive function.
public func fix<T, U>(_ f: @escaping (@escaping (T) -> U) -> (T) -> U) -> (T) -> U {
	return { f(fix(f))($0) }
}
