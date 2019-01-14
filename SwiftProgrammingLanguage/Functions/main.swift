//
//  main.swift
//  Functions
//
//  Created by gl on 16/9/5.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Functions(4.2)

import Foundation

//MARK: - Functions
//函数是自包含的代码块来还行一些特定的任务。在Swift中函数拥有类型，类型由函数的参数类型、返回值类型组成。

//MARK: - Defining and Calling Functions
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello(personName: "Anna"))

//MARK: - Function Parameters and Return Values
//Swift的函数的参数和返回值都非常灵活

//MARK: - Functions Without Parameters
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

//MARK: - Functions With Multiple Parameters
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloWorld()
    } else {
        return sayHello(personName: personName)
    }
}
print(sayHello(personName: "Tim", alreadyGreeted: true))

//MARK: - Functions Without Return Values
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye(personName: "Dave")

//MARK: - Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMin {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//MARK: - Optional Tuple Return Types
//从函数中返回空的元组，例如(Int, Int)?或者(String, Int, Bool)?
func minMaxOrNil(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMaxOrNil(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

//MARK: - Function Argument Labels and Parameter Names
//每一个函数参数都拥有一个参数标签和参数名称，参数标签写在参数名称的前面；参数标签在调用函数的时候使用，参数名称在函数的实现中使用。默认情况下，函数的参数标签和参数名称相同
//函数的所有参数的参数名称都不能缺少并且不能重复，不同函数参数的参数标签可以相同，但是为了可读性不建议使用相同的参数标签；
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    print("firstParameter: \(firstParameterName), secondParameter: \(secondParameterName).")
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//MARK: - Specifying Argument Labels
func someFunction(argumentLabel parameterName: Int) {
    
}
//argumentLabel在调用函数的时候使用，parameterName在函数内部使用

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
//函数为sayHello(to:and:)

//MARK: - Omitting Argument Labels
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)

//MARK: - Default Parameter Values
func someFunction(_ parameterWithDefault: Int = 12) {
    print("default parameter values: \(parameterWithDefault).")
}
someFunction(6)
someFunction()

//MARK: - Variadic Parameters
//函数的可变参数形式，在类型后面跟...，在函数按照数组来访问即可
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}
let _ = arithmeticMean(numbers: 1, 2, 3, 4, 5)
let _ = arithmeticMean(numbers: 3, 8.25, 18.75)
//一个函数最多只能有一个可变参数

//MARK: - In-Out Parameters
//函数的参数默认都是常量，如果我们想在函数里面改变参数的值的话，则可以使用in-out参数来实现。In-out参数不能有默认值，可变参数不能被标识为inout。
//常量和字面值常量不能标记为inout，因为它们的值无法进行修改，调用函数的时候，需要在参数的前面加上&。
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt).")

//MARK: - Function Types
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
//上面两个函数的类型为 (Int, Int) -> Int

//MARK: - Using Function Types
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(1, 4)).")

//MARK: - Function Types as Parameter Types
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b)).")
}
printMathResult(addTwoInts, 3, 5)

//MARK: - Function Types as Return Types
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(_ backwards: Bool) -> (Int) -> Int {
    return backwards ? stepForward : stepBackward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
print("Result: \(moveNearerToZero(currentValue)).")

//MARK: - Nested Functions
func chooseStepFunction1(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    return backwards ? stepBackward : stepForward
}
