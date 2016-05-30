//  Copyright (c) 2015 Rob Rix. All rights reserved.

// MARK: - Components extraction

public func first<T, U>(tuple: (T, U)) -> T {
    return tuple.0
}

public func second<T, U>(tuple: (T, U)) -> U {
    return tuple.1
}