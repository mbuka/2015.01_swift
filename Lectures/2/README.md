# Lambda Academy 2015.01 - Swift
## Lecture 2 - Voter app

We're going to implement an iPad app that will be used during Lambda Days 2015 to cast votes right after presentations. This way we'll be able to collect a feedback from our attendies and share this information together with some other statistics.

#### Prerequisites
- Make sure you have active Github account and then fork this repository.
- Get familiar with the codebase.
- If there is anything unclear - ask!

### Unit Tests

#### Exercise 1
Write unit test in `testVoteManagerAccumulatesVotes` (VoterTests.swift) that will check if VoteManager collects casted votes.
Hint1: to examine a condition use: `XCTAssert`
Hint2: to compare arrays use: `equal` method of swift standard library

#### Exercise 2
It will be our first time adding add a new functionality to the app. We want the votes `median` to be shown on the main app screen. Happily, someone else has implemented `median` method on VoteManager already. Before we add this new feature we need to be sure this method returns the right results, thus we will start by implementing unit test that will cover this method...

- Implement `testVoteManagerMedian` in VoterTests.swift
- You can use the following test scenarios:
```swift
[] -> None
[Like, Neutral, Like] -> Like
[Like, Hate, Like, Hate, Hate] -> Hate
[Like, Like, Like, Neutral, Neutral, Neutral, Like, Neutral, Neutral] -> Neutral
```swift

- Implement a feature that will present `median` information next to the pie chart (you can use one of the images that are already in the app representing 3 different Votes)

### QuickCheck
In our previous exercise we have added a couple of tests, unfortunatelly some of these tests have missed egde cases that will lead to failure. To ommit such a situation we need to change our approach. Adding more unit tests will not guarantee us better test coverage. We just need better tools. Instead of testing particular situations that we can imagine one by one, let's test `properties`. As an example we can take the simples test we have in our app: `testMath`. Take a look at the following method:
```swift
func plusIsCommutative(x: Int, y: Int) -> Bool {
    return x + y == y + x
}
```swift

This function is a QuickCheck `property`. It takes arguments and then using this two numbers we check if `+` is commutative. We don't really care about `x` and `y`. We want our testing framework to test it on as many values as possible.

#### Exercise 1
- Implement QuickCheck test in `QuickCheckTests.swift` that will test `plusIsCommutative` property.

Hint1: to verify property use the following syntax:
```swift
Check(property, "description")
```swift

Hint2: you'll need to write an extension on `Int` type, that will make this type conform to: `Arbitrary` and `Smaller` protocols defined by QuickCheck.

- rewrite this test so it uses inline lambda instead of a reference to function


#### Exercise 2
Reimplement unit test called `testVoteManagerAccumulatesVotes` to QuickCheck. To do so you'll have to:

a)  As a first step extend `Vote` with `Arbitrary` and `Smaller`. When you do that you should be able to test like this:
```swift
func voteManagerAccumulatesSingleVotes(vote: Vote) -> Bool {
    let vm = VoteManager()
    vm.makeVote(vote)
    
    return equal(vm.votes, [vote], { $0 == $1 })
}
```swift

b) Change the property from point a. so it takes an array of votes, we want to test VoteManager on as many possible Vote sequences as possible. 

c) To make a change from b. compile we need to add extend QuickCheck so it supports arrays. As for now it only supports Characters, Strings, Int (implemented in Exercise 1) and Vote (implemented in Exercise 2). Now we need support for an array of Votes...

- implement a dummy extension on `Array` that will adopt it to `Smaller` protocol by returning nil

- implement a new `check` method that takes an array as an argument:
```swift
func check<X: Arbitrary>(message: String, prop: [X] -> Bool) -> (Bool)
```swift

Hint: create a new `ArbitraryI` struct with two lambdas for retrieving smaller (use the dummy extension) and arbitrary array (a templete method that will produce an array of some random size with arbitrary elements of type T)

d) use the new `check` method to implement `Check` helper that takes an array and then use it to verify if `voteManagerAccumulatesVotes` property (that takes an array of votes) and then use it.
Hint: Take a look at the `Check` helper that is already implemented in `QuickCheckTests.swift` for ordinary type and a tuple.

e) Yes. You're right test didn't pass. In Xcode console you'll see a description of this failure in a form `...  doesn't hold: `. Here you've got an array that caused this test to fail. As you can see it is pretty large... We can enhance it by providing a proper implementation of `Smaller` on Array type.

- reimplement the dummy `smaller` implementation from point c. so it removes one element from array until it has as empty array (return nil in this case)

f) Launch QuickCheck tests again and check out the new failing array, notice it has 11 elements. It looks like VoteManager works fine only when processing 10 and less Votes, fix the issue.

#### Exercise 3
a) Reimplement another unit test `testVoteManagerMedian` by implementing the following QuickCheck properties:

- voteManagerReturnsNones - Vote.Note should be returned when a: voteManager is empty, b: if there is more than one winner (Vote type with the largest amount of votes)
- voteManagerReturnsWinningVoteType - for all vote permutations that have a direct winner (a vote type with the largest amount of votes) VoteManager will return this vote type.

b) Fix all the issues raised by this check.

#### Exercise 4
Prepare and send a pull request that contains:

- a working QuickCheck implementation
- QuickCheck tests that cover "accumulating votes" and "median"
- new functionality that adds the "median" image to the application (if can be deducted)


#### Homework
- Add QuickCheck test covering the following methods from VoteManager: `likes`, `neutrals`, `hates`
- Refactor VoteManager and it's methods: `likes`, `neutrals`, `hates` extracting the common part
- Reimplement tests and make your new QuickCheck properties are still valid
- Feel free to implement anything you think will be a step forward and a send pull request :)