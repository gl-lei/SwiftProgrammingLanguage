//
//  main.swift
//  Generics
//
//  Created by ggl on 2018/12/31.
//  Copyright © 2018年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Generics(4.2)

import Foundation

//MARK: - The Problem That Generics Solve
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//上面的两个函数中，a和b都是相同的类型，如果a和b是不同的类型，则不可能来交换它们的值。Swift是一个类型安全的语言，不会允许不同类型的变量直接交换它们的值。

//MARK: - Generic Functions
//泛型定义交换两个变量值的函数，T表示任意类型
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt1 = 3
var anotherInt1 = 107
swapTwoValues(&someInt1, &anotherInt1)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

//注意，swift标准库中有一个swap函数与我们上面定义的函数功能相同

//MARK: - Type Parameters
//在上面的函数中，类型占位符T是泛型中的一种类型参数的例子。类型参数指定并命名占位符类型，它们定义在函数名称后面的一对尖括号中。（<T>）
//指定好类型参数后，我们可以在函数参数、函数返回值以及函数体中使用它。在调用函数的地方，类型参数将被指定为实际的类型。
//我们可以提供多个类型参数，不同的类型参数之间使用逗号隔开即可

//MARK: - Naming Type Parameters
//当类型参数之间有相互关系的时候，可以指定它们有意义的名称，例如字典类型Dictionary<Key, Value>;数组类型Array<Element>;当它们之间没有关系的时候，可以使用大写英文字母来表示，例如T、U、V等。
//命名遵循大写首字母驼峰命名法（MyTypeParameter等）

//MARK: - Generic Types
//除了泛型函数之外，swift还可以定义我们自定义的泛型类型，例如自定义类、结构体以及枚举类型等；
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("undo")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()
print("fromTheTop is \(fromTheTop)")

//MARK: - Extending a Generic Type
//当我们对泛型进行扩展时，我们不能在扩展的定义中提供类型参数列表，只能使用泛型定义的类型参数。
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

//MARK: - Type Constraints
//上面定义的泛型函数swapTwoValues(_:_:)和泛型Stack容器对任何类型都适用，但有时候在泛型函数或者泛型类型中，使用某些特定类型会比较有用处。类型约束可以指定类型参数必须继承于特定的类，或者必须遵循特定的协议或协议组合。
//比如Dictionary类型，所有Dictionary的Key都必须是可hashable的（遵循hashable协议）。这个要求通过对Key使用类型约束来实现，Dictionary的Key必须遵循hashable协议才可以。所有swift的基本类型（String、Int、Double、Bool等）默认都是实现了hashable协议的。

//MARK: - Type Constraints Syntax
/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    //function body goes here
}*/

//上面定义了两个类型参数：T和U；T有一个类型约束：必须继承自SomeClass类；U有一个类型约束：必须遵循SomeProtocol协议

//MARK: - Type Constraints in Action
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex is an optional Int with no value, because 9.3 isn't in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex is an optional Int containing a value of 2

//MARK: - Associated Types
//当定义协议的时候，有时候会定义协议的时候会定义一个或者多个与协议相关联的类型。关联类型提供了类型占位符名称，在协遵循协议的时候它会被指定实际的类型。关联类型使用associatedtype关键字来指定。

//MARK: - Associated Types in Action
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//下面是无泛型IntStack容器的写法
struct IntStack: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
//上面IntStack类通过使用typealias Item = Int将抽象类型Item实现为Int类型。
//由于swift有类型推断功能，我们可以完全不写typealias Item = Int。Swift会自动推断出Item的类型，完全可以将typealias Item = Int删掉。

//我们还可以使用泛型版本
struct StackGenerics<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    //conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//MARK: - Extending an Existing Type to Specify an Associated Type
//我们可以通过扩展来让类遵循某个协议，这也包含了拥有关联类型的协议；
//Swift的Array类型早已提供了append(_:)方法、count属性以及下标操作方法，这满足了Container协议的要求。我们可以通过Array的扩展来让Array遵循Container协议。
extension Array: Container {}

//MARK: - Adding Constraints to an Associated Type
//我们可以给协议中的关联类型添加类型约束来让类型满足这些约束。例如下面的协议中的关联类型必须要求遵循equatable协议
protocol ContainerEqualable {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//MARK: - Using a Protocol in Its Associated Type's Constraints
//协议本身可以作为协议要求的一部分，例如下面的例子中定义了suffix(_:)方法，suffix(_:)方法用来返回一个Suffix类型，Suffix类型包含从指定的元素下标到容器结束的所有容器元素。
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
//在SuffixableContainer协议中，Suffix是一种关联类型。Suffix关联类型有两个约束条件：它必须遵循SuffixableContainer协议；它的Item类型必须与SuffixableContainer容器的Item类型一致；
extension IntStack: SuffixableContainer {
    func suffix(_ size: Int) -> IntStack {
        var result = IntStack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}

extension StackGenerics: SuffixableContainer {
    func suffix(_ size: Int) -> StackGenerics {
        var result = StackGenerics()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}
var stackOfInts = StackGenerics<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)
print("suffix: \(suffix)")

//MARK: - Generic Where Clauses
//使用where语句来对类型添加条件约束，将where语句写在类型或者函数的大括号前面位置处。
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

//MARK: - Extensions with a Generic Where Clause
extension StackGenerics where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

//MARK: - Associated Types with a Generic Where Clause
protocol ContainerWhere {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

//当协议继承自另外的协议的时候，可以对协议中的关联类型添加约束
protocol ComparableContainer: Container where Item: Comparable { }

//MARK: - Generic Subscripts
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}
