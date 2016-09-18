# Prelude

This is a Swift µframework providing a number of simple functions that I use in many of my other frameworks. Rather than continue to reimplement them for each consumer, I am gathering them here together.

Notably, this framework does not provide any new types, or any functions which operate on custom types; those presumably belong in µframeworks of their own.


## Table of Contents

- [Gallery](#gallery)
	- [`id`](#id)
	- [`const`](#const)
	- [`>>>` and `<<<`](#-and-)
	- [`fix`](#fix)
	- [`|>` and `<|`](#-and--1)
	- [`curry`](#curry)
	- [`flip`](#flip)
	- [`&&&`](#-)
	- [`swap`](#swap)
	- [`first` and `second`](#first-and-second)
- [Documentation](#documentation)
- [Integration](#integration)


# Gallery

Prelude’s functions are infinitely useful. Here’s a gallery of just a few of the things you can do with them.


## `id`

Passing `id` as the argument to the `flattenMap` method of a [`Stream`](https://github.com/robrix/Traversal) of `Stream`s will flatten it out into a stream of all the nested elements:

```swift
func flatten<T>(stream: Stream<Stream<T>>) -> Stream<T> {
	return stream.flattenMap(id)
}
```


## `const`

Passing the result of `const` to an [`Either`](https://github.com/robrix/Either) is convenient for transforming it into an `Optional<T>`:

```swift
let result: Either<NSError, String> = …
if let string = result.either(const(nil), id) {
	println("ohai \($0)")
}
```


## `>>>` and `<<<`

The left-to-right and right-to-left composition operators (`>>>` and `<<<` respectively) chain operations together:

```swift
let repl: File -> String = readLine >>> parseString >>> evaluateAST >>> toString
while true {
	println(repl(standardInput))
}
```


## `fix`

You can use `fix` to make an anonymous function which calls itself recursively:

```swift
let factorial = fix { recur in
	{ n in n > 0 ? n * recur(n - 1) : 1 }
}
```

## `|>` and `<|`

The forward and backward application operators (`|>` and `<|` respectively) apply the function on the side they’re pointing at to the value on the other side.

This can sometimes make code more readable. This is particularly the case for the forward application operator. `x |> f` is equivalent to `f(x)`, but it reads in the direction that the data flows. The benefit is more obvious with longer function names:

```swift
100 |> toString |> count // => 3
// this is equivalent to
countElements(toString(100))
```

Backward application reads in the wrong direction for this—`f <| x` isn’t really any improvement on `f(x)`. Unlike forward application, however, `<|` can apply binary and ternary functions to their first operands. This enables you to make something like [Haskell’s operator sections](https://www.haskell.org/haskellwiki/Section_of_an_infix_operator):

```swift
let successor: Int -> Int = (+) <| 1
successor(3) // => 4
map([1, 2, 3], (*) <| 2) // => [2, 4, 6]
```

You can also combine `|>` and `<|` with [`flip`](#flip) to pass data through chains of higher-order functions like `sorted`, `map`, and `reduce`:

```swift
let result =
	[66, 78, 1, 95, 76]
|>	(flip(sorted) <| (<)) // sort in ascending order
|>	(flip(map) <| toString) // make them into strings
|>	String.join(", ") // comma-separate them

let sum: [Int] -> Int = flip(reduce) <| (+) <| 0
```

Since Swift functions can also be applied to tuples of their arguments, you can also use `|>` and `<|` with binary, ternary, etc. functions just by placing a tuple on the other side:

```swift
(1, 2) |> (+) // => 3
```


## `curry`

Currying takes a function of >1 parameter and returns a function of one parameter which returns a function of one parameter, and so on. That is, given `(T, U) -> V`, currying returns `T -> U -> V`.

This is particularly useful when making more interesting functions such as [`<|`](#-and--1).


## `flip`

Faux operator sectioning using `<|` might be a little surprising using non-commutative operators like `-` and `/`: `(-) <| 1` means `{ 1 - $0 }`, which is very different from `{ $0 - 1 }`. You can use `flip` to produce the latter:

```swift
map([1, 2, 3], (-) <| 1) // => [0, -1, -2]
map([1, 2, 3], flip(-) <| 1) // => [0, 1, 2]
```


## `&&&`

`Optional` has a `map` method which is just what you need when you want to apply a function to a value if non-`nil`, or return `nil` otherwise. When you have two `Optional` values, you can use `&&&` to combine them:

```swift
let (x: Int?, y: Int?) = (2, 2)
(x &&& y).map(+) // => .Some(4)
```


## `swap`

Swift’s tuples are very convenient, but sometimes when you get one, it’s the wrong way around. `swap` does to tuples what `flip` does to functions: it reverses their order.

```swift
map(enumerate("hello"), swap) // => [(h, 0), (e, 1), (l, 2), (l, 3), (o, 4)]
```

## `first` and `second`

Getting one value from a tuple is a common operation that can be expressed with `first` and `second` functions. Operators provide first and second values of two-elements tuple accordingly.

```swift
[(0,0), (5, 1), (9, 2)].map(second) // => [0, 1, 2]
```

# Documentation

Full API documentation is in the source.


# Integration

1. Add this repository as a submodule and check out its dependencies, and/or [add it to your Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) if you’re using [carthage](https://github.com/Carthage/Carthage/) to manage your dependencies.
2. Drag `Prelude.xcodeproj` into your project or workspace.
3. Link your target against `Prelude.framework`.
4. Application targets should ensure that the framework gets copied into their application bundle. (Framework targets should instead require the application linking them to include Prelude.)
