//
//  main.swift
//  Control Flow
//
//  Created by gl on 16/8/29.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Control Flow(4.2)

import Foundation

//Swift提供了类似C语言形式的流程控制语句，包括：for、while循环，if、guard、switch条件表达式，break、continue流程流向改变语句。
//Swift的switch语句比C语言的switch语句更加完善、强大。C语言中的switch语句中，如果case条件中缺少了break，则会发生“fall through”现象，Swift中不会产生这种现象。此外，case还能匹配不同的模式(where)。

//MARK: - For Loops
//Swift提供了两种类型的循环：for-in与for

//MARK: - For-In
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//MARK: - For
for index in 0..<3 {
    print("index is \(index)")
}

let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("\(tickMark)")
}
print("======================")

for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    print("\(tickMark)")
}

//MARK: - While Loops
var loops = 0
var result = 0
while loops < 100 {
    result += loops
    loops += 1
}
print("result = \(result).")

//MARK: - Repeat-While
loops = 0
result = 0
repeat {
    result += loops
    loops += 1
} while loops < 100
print("result1 = \(result).")

//MARK: - Conditional Statements

//MARK: - If
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

//MARK: - Switch
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
//switch不加break也是没有任何问题的。

//MARK: - No Implicit Fallthrough
let anotherCharacter: Character = "a"
switch anotherCharacter {
//case "a":
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//不注释代码的话以上将要报错，和C语言不一样，swift中只要有case里面不包含任何可执行语句则将报错。如果想匹配多个条件的话，只需要用分号隔开即可。
switch anotherCharacter {
case "a", "A":
    print("The letter a or A")
default:
    print("Not the letter A and a")
}

//MARK: - Interval Matching
//Switch中的值可以比较范围
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a fwe"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//闭范围运算符和半闭范围运算符被重载来返回IntervalType或者Range类型。

//MARK: - Tuples
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is ont the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box)")
}

//MARK: - Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let(x, y):
    print("somewhere else at (\(x), \(y))")
}

//MARK: - Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//MARK: - Control Transfer Statements
//流程改变语句主要有：continue、break、fallthrough、return、throw

//MARK: - Continue
//跳过本次循环，进入下次循环

//MARK: - Break
//结束所在的循环

//MARK: - Fallthrough
//C语言中的Switch中的case语句匹配成功后，如果没有在case结束的地方添加break，则会跳入下一个case语句执行代码，直到遇到break语句。Swift中的Switch避免了这种情况的发生，如果你想要这种情形的话，则可以通过fallthrough来实现。
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

//MARK: - Labeled Statements
//我们可以嵌套循环和条件表达式，有时候我们可能会想通过break终止某一个循环或者条件表示式，如果语句国语复杂的话我们就可以通过通过statement label来实现。
var res = 30
var square = 200
gameLoop: while res != 100 {
    switch square {
    case 40..<60:
        break gameLoop
    case 60...100:
        square += 10
        continue gameLoop
    default:
        square -= res
        res += 10
    }
}
print("square = \(square), res = \(res).")
print("Game Over!")

//MARK: - Early Exit
//guard语句与if语句类似，只有在条件成立的时候，后面的语句才能得到执行。但是和if语句不同的是，guard语句通常会有else分句。
//guard语句需要用在循环语句或者条件语句中

func greet(_ person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(["name": "John"])
greet(["name": "Jane", "location": "Cupertino"])

//使用guard来进行解包操作很方便，不用使用if语句来写额外的else语句。

//MARK: - Checking API Availability
//Swift拥有内置的检测API可用性的方式，可以确保我们使用可靠的API。
if #available(iOS 9, macOS 10.10, *) {
    //使用iOS9的API，使用OSXv10.10的API
} else {
    
}
//平台：iOS、macOS、watchOS、tvOS
//格式 if #available(平台名称 版本, ..., *) {} else {}
