//
//  main.swift
//  Closures
//
//  Created by gl on 16/9/6.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Closures(4.2)

import Foundation

//MARK: - Closures
//闭包类似于C语言和OC语言中的block，类似于其他语言的lambdas表达式。闭包可以持有存储用到的任何常量和变量的引用。Swift会处理持有的对象的内存管理。
//全局函数以及嵌套函数都是闭包的一种特殊形式。闭包有三种形式：
//1. 全局函数是一种拥有名称但不持有任何变量的闭包。
//2. 嵌套函数是一种拥有名称并且在作用域内持有变量的闭包。
//3. 闭包表达式是一种没有名称的、轻量级语法的、可以在作用域内持有变量的闭包。

//MARK: - Closure Expressions

//MARK: - The Sorted Method
//Swift标准库提供一个sorted(by:)方法，可以为一个数组里面的所有元素进行排序, 输出排序后的一个数组，数组顺序取决于我们提供的闭包实现。
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sorted(by: backwards)
print("reversed: \(reversed).")

//MARK: - Closure Expression Syntax
//语法形式：{(parameters) -> return type in statements}
reversed = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
});
print("reversed: \(reversed).")

//MARK: - Inferring Type From Context
//因为排序闭包作为参数传递给方法，swift可以推断出闭包的参数类型和返回值类型。在sorted(by:)方法中，参数必须是(String, String) -> Bool类型，所以(String, String)和Bool类型就可以省略掉。因为所有的类型都可以推断出来，所以返回箭头(->)也可以省略掉，参数两边的括号也可以省略掉：
reversed = names.sorted(by: { s1, s2 in
    return s1 > s2
})
print("reversed: \(reversed).")

//当闭包传递给函数或者方法的时候，总是可以推断出闭包的参数类型和返回值类型。因此，这种情况下我们就不需要写闭包的完整格式。

//MARK: - Implicit Returns from Single-Expression Closures
//通过删除return关键字，单条语句的闭包可以隐式的返回表达式的结果
reversed = names.sorted(by: {s1, s2 in s1 > s2})

//MARK: - Shorthand Argument Names
//Swift同样提供了简短的参数名字形式以供在项目里面使用，$0, $1, $2, 如果在项目中使用这些简短的名称，则你可以省略闭包的参数列表。
reversed = names.sorted(by: {$0 > $1})
print("reversed: \(reversed).")

//MARK: - Operator Methods
//这是一种更加简单的书写闭包表达式的方式，Swift中的String类型定义了>操作运算符，我们可以直接使用定义好的这个方法。
reversed = names.sorted(by: >)
print("reversed: \(reversed).")

//MARK: - Trailing Closures
//如果需要传递一个闭包表达式给函数并且作为函数的最后一个参数，但可能闭包表达式太长。这时候我们就可以使用Trailing Closures闭包形式。
//Trailing Closure是一种特殊的闭包表达式，它写在函数参数列表的圆括号之后。
//使用Trailing Closures调用函数的时候，不能在闭包前面使用参数标签(argument label)

//定义一个函数
func someFunctionThatTakesAClosure(closure: () -> Void) {
    //函数体
}

//使用闭包
someFunctionThatTakesAClosure(closure: {
    //闭包代码
})

//使用Trailing Closure之后
func someFunctionThatTakesAClosure() {
    //闭包代码
}

reversed = names.sorted() {$0 > $1}

//如果闭包表达式是函数或者方法的唯一参数，如果闭包采用trailing closure来写，则可以省略函数名或者方法名后的一对括号。
reversed = names.sorted {$0 > $1}
print("reversed: \(reversed).")

//数组的map(_:)方法示例
let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510]

let mapArray = numbers.map() {
    number -> String in
    var tmpNum = number
    var result: String = ""
    
    while tmpNum != 0 {
        let num = tmpNum % 10
        result = digitNames[num]! + result
        tmpNum = tmpNum / 10
    }
    return result
}
print("mapArray: \(mapArray).")

//MARK: - Capturing Values
//闭包可以持有其作用域内的常量和变量，并且可以修改这些变量的值，即使这些变量定义的作用域不存在了。
//最简单的持有变量的方式是嵌套函数形式的闭包
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        //持有外部变量runningTotal与amount(引用方式)
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())

//如果将闭包赋值给类实例的一个属性的话，那么这个闭包会通过引用持有改类实例或者类实例的成员变量，这样的话你将在闭包和该类实例之间创建强引用环。Swift使用capture lists来打破这个强引用环。

//MARK: - Closures Are Reference Types
//在上面的例子中，incrementBySeven和incremntByTen都是常量，但是它们所指向的闭包仍然能让持有的runningTotal变量发生变化，这是因为函数和闭包都是引用类型。
//这意味着当你赋值一个闭包给不同的常量或者变量，这些常量或者变量实际指向的是同一个闭包。
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())


//MARK: - Escaping Closures
//当一个闭包作为函数的参数传递给函数，但是是在函数执行完之后才被调用(在函数体中没有调用闭包)，这样我们称这个闭包逃离了这个函数。当我们声明一个带有闭包参数的函数的时候，我们可以使用@escaping放在闭包参数名称的前面来表示这个闭包允许逃离。

//Escaping Closure示例：(逃离的闭包，主要用在异步操作里面)
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//@escaping修改的闭包意味着你只能在闭包中显式的使用self。例如，在下面的代码中，someFunctionWithEscapingClosure(_:)函数的参数是一个逃离闭包（escaping closure）,这意味着在闭包中需要显式的使用self。相反，someFunctionWithNonescapingClosure(_:)的参数是一个不可逃离闭包，可以在闭包中隐式的使用self。
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
//打印200

completionHandlers.first?()
print(instance.x)
//打印100

//MARK: - Autoclosures
//自动闭包是闭包的一种，它包裹一个表达式来作为参数传递给函数。自动闭包没有参数，当它被调用的时候，它将返回包裹在其内部的表达式的值。这种语法形式很方便的让我们删掉函数参数周围的大括号，

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = {customersInLine.remove(at: 0)}
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)


func serveCustomer(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customer: {customersInLine.remove(at: 0)})

//在定义函数的时候，我们可以通过使用@autoclosure属性来标识参数，就可以让参数自动的转换为闭包的形式。
func serveCustomer(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customer: customersInLine.remove(at: 0))

//过度使用自动闭包会让你的代码变得难以理解。代码上下文和函数名字都应该明确操作。
//如果自动闭包允许逃离，需要使用@autoclosure 和 @escaping 属性。
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
