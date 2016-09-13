//  Copyright (c) 2015 Rob Rix. All rights reserved.

// MARK: - Components extraction

public func first<T, U>(_ tuple: (T, U)) -> T {
    return tuple.0
}

public func second<T, U>(_ tuple: (T, U)) -> U {
    return tuple.1
}
