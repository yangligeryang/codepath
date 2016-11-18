//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Arrays
let integers = [1,2,3,4,5,6,7,8,9]

let firstItem = integers[0]
let thirdItem = integers[2]
let anotherFirstItem = integers.first
let lastInt = integers.last
let numberofInts = integers.count
let reversedArray = integers.reversed()

for integer in integers {
//    print(integer)
}

var colors = ["red", "blue", "green", "yellow"]

for (index, color) in colors.enumerated() {
//    print("the color \(color) is at index \(index)")
}

colors[1] = "purple"
colors

let removedColor = colors.remove(at: 2)
colors
removedColor

// Dictionaries
let movie1 = ["title": "Wayne's World",
    "overview": "Wayne and Garth go on a crazy adventure"]
let movie2 = ["overview": "Maverick and Goose try to outfly Iceman",
    "title": "Top Gun"]
let movie3 = ["overview": "Airel wants to be a real woman", "title": "The Litte Mermaid"]
let movies = [movie1, movie2, movie3]

let title = movie1["title"]
let title2 = movie2["title"]
let overView = movie1["overview"]

for movie in movies {
    print("in \(movie["title"]!), \(movie["overview"]!)")
}

let response: [String: Any] = ["dates": "someStuff", "pages": "moreStuff", "results": movies]
let results = response["results"] as! [NSDictionary]
let result = results[1]
let resultTitle = result["title"]!
print("\(resultTitle)")
