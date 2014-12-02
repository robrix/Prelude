# Prelude

This is a Swift microframework providing a number of simple functions that I use in many of my other frameworks. Rather than continue to reimplement them for each consumer, I am gathering them here together.

Notably, this framework does not provide any new types, or any functions which operate on custom types; those presumably belong in µframeworks of their own.


## Use

### `id`

Passing `id` as the argument to the `flattenMap` method of a [`Stream`](https://github.com/robrix/Traversal) of `Stream`s will flatten it out into a stream of all the nested elements:

```swift
func flatten<T>(stream: Stream<Stream<T>>) -> Stream<T> {
	return stream.flattenMap(id)
}
```


### `const`

Passing the result of `const` to an [`Either`](https://github.com/robrix/Either) is convenient for transforming it into an `Optional<T>`:

```swift
let result: Either<NSError, String> = …
if let string = result.either(const(nil), id) {
	println("ohai \($0)")
}
```


### `>>>` and `<<<`

The left-to-right and right-to-left composition operators (`>>>` and `<<<` respectively) chain operations together:

```swift
let repl: File -> String = readLine >>> parseString >>> evaluateAST >>> toString
while true {
	println(repl(standardInput))
}
```


### `fix`

You can use `fix` to make an anonymous function which calls itself recursively:

```swift
let factorial = fix { recur in
	{ n in n > 0 ? n * recur(n - 1) : 1 }
}
```


## Documentation

API documentation is in the source.


## Integration

1. Add this repository as a submodule and check out its dependencies, and/or [add it to your Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) if you’re using [carthage](https://github.com/Carthage/Carthage/) to manage your dependencies.
2. Drag `Prelude.xcodeproj` into your project or workspace.
3. Link your target against `Prelude.framework` and each of the dependency frameworks.
4. Application targets should ensure that the framework gets copied into their application bundle. (Framework targets should instead require the application linking them to include Prelude.)
