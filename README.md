# Prelude

This is a Swift µframework providing a number of simple functions that I use in many of my other frameworks. Rather than continue to reimplement them for each consumer, I am gathering them here together.

Notably, this framework does not provide any new types, or any functions which operate on custom types; those presumably belong in µframeworks of their own.


## Table of Contents

- [Gallery](#gallery)
	- [`id`](#id)
	- [`const`](#const)
	- [`>>>` and `<<<`](#-and-)
	- [`fix`](#fix)
	- [`|>` and `<|`](-and--1)
	- [`curry`](#curry)
	- [`flip`](#flip)
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

This can sometimes make code more readable. This is particularly the case for the forward application operator since it reads left-to-right, presenting the data flow in the natural order for e.g. English text:

```swift
100 |> toString |> countElements // => 3
// vs.
countElements <| toString <| 100
// which means the same thing as
countElements(toString(100))
```

These operators have lower precedence than the composition operators, which enables us to use them with composed functions. For example, we could also have written the above example as:

```swift
100 |> toString >>> countElements
```

Functions can also be applied to tuples of their arguments. This means that we don’t need special cases of these operators to handle binary, ternary, etc. operators (as is necessary in F# for example). You can use `|>` and `<|` with binary functions just by placing a tuple on the other side:

```swift
(1, 2) |> (+) // => 3
```


## `curry`

Currying takes a function of >1 parameter and returns a function of one parameter which returns a function of one parameter, and so on. That is, given `(T, U) -> V`, currying returns `T -> U -> V`.

You can use this to do something like [Haskell’s operator sections](https://www.haskell.org/haskellwiki/Section_of_an_infix_operator), applying one operand to a binary operator, e.g. the increment function over integers:

```swift
map([1, 2, 3], 1 |> curry(+)) // => [2, 3, 4]
```

We’re using Prelude’s  [`|>`](-and--1) operator here to emphasize the idiom, but you can also write it using normal function application:

```swift
map([1, 2, 3], curry(+)(1)) // => [2, 3, 4]
```


## `flip`

Faux operator sectioning using `curry` might be a little surprising using non-commutative operators, for example `-` and `/`: `1 |> curry(-)` means `{ 1 - $0 }`, which is very different from `{ $0 - 1 }`. You can use `flip` to get the latter:

```swift
map([1, 2, 3], 1 |> curry(-)) // => [0, -1, -2]
map([1, 2, 3], 1 |> curry(flip(-))) // => [0, 1, 2]
```


# Documentation

Full API documentation is in the source.


# Integration

1. Add this repository as a submodule and check out its dependencies, and/or [add it to your Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) if you’re using [carthage](https://github.com/Carthage/Carthage/) to manage your dependencies.
2. Drag `Prelude.xcodeproj` into your project or workspace.
3. Link your target against `Prelude.framework` and each of the dependency frameworks.
4. Application targets should ensure that the framework gets copied into their application bundle. (Framework targets should instead require the application linking them to include Prelude.)
