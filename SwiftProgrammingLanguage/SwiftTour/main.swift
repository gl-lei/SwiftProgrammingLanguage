//
//  main.swift
//  SwiftTour
//
//  Created by gl on 16/7/5.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Swift Tour(4.2)

import Foundation

print("Hello, World!")

//MARK: - Simple Values
///Simple Values
var myVariable = 42
myVariable = 50

let myConstant = 32

let explicitDouble: Double = 70
let constValue:Float = 4

//值永远不能隐式转换类型，如果想要转换数据到另外的类型，显式的声明所需的类型
let label = "The width is"
let width = 94
let widthLabel = label +  String(width)  //不同类型的变量不能一起做运算

//更加简单的方式
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let friutSummary = "I have \(apples + oranges) pieces of fruit."


//使用三个双引号来表示多行文字
let quotation = """
Even though there's whitespace to the left,
                哈哈哈哈
I will have \(apples + oranges) pieces of fruit.
"""
print(quotation)

//使用[]来创建数组和字典，也是通过下标来访问元素,数组不能通过下标来添加元素
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
print(shoppingList)
shoppingList.append("新元素")
print(shoppingList)

//字典可以通过键值对来添加新元素
var occupations: Dictionary = ["Malcolm": "Captain", "Kaylee": "Mechanic",]
occupations["Jayne"] = "Public Relations"
print(occupations)

//创建空数组或者空字典
var emptyArray = [String]()
var emptyDictionary =  [String: Float]()

//如果可以推断类型，则可以这样写
emptyArray = []
emptyDictionary = [:]

//MARK: - Control Flow
///Control Flow
//条件使用if、switch，循环使用for-in、while、repeat－while
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//注意if条件必须是布尔表达式，不能进行隐式转换

//if和let可以一起使用来对optional变量进行解包
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello, \(name)"
}

//使用??运算符来给optional变量提供默认值
let nickName: String? = "gl"
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

//switch支持任何类型的数据和大量的比较运算符
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

//不需要在case后面添加break

//使用元组来遍历字典
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, number) in interestingNumbers {
    for num in number {
        if num > largest {
            largest = num
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n = n + 2
}
print(n)

var m = 2
repeat {
    m = m + 2
} while m < 100
print(m)

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

//c风格的for循环将要在未来的swift版本中移除(已经在Swift3.0中移除)
var secondForLoop = 0
for i in 0 ..< 4 {
    secondForLoop += i
}
print(secondForLoop)

//使用..<(不包括最大值)和...(包括最大值)来做循环

//MARK: - Functions and Closures
///Functions and Closures
func greet(_ name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
print(greet("Bod", day: "Tuesday"))

func calculateStatistics(_ scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics([5, 3, 100, 5, 9])
print(statistics.sum)
print(statistics.2)


//参数顺序：外部参数名(可以使用_来省略外部显示的参数名，不指定的话默认与内部参数名一样)、内部参数名
func sumOf(_ numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
print(sumOf(42, 100, 78))

//嵌套函数
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    
    add()
    return y
}
print(returnFifteen())

//函数类型为第一类别(first-class)，意味着函数可以返回另外一个函数
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(_ number: Int) -> Int {
        return number + 1
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

//函数作为参数
func hasAnyMatches(_ list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(_ number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(numbers, condition: lessThanTen))

//函数是闭包的一种特殊形式，闭包可以没有名字，只需要使用{}以及里面的执行代码即可。使用in来分离闭包的参数和返回值

print(numbers)
let values = numbers.map({
    (number: Int) -> Int in
//    let result = 3 * number
//    return result
    
    //如果是奇数就返回0
    if (number & 1) != 0 {
        return 0
    }
    return number
})
print(values)

//闭包的简写形式，如果知道闭包的类型，则可以删除闭包的参数、返回值，单语句的闭包隐式返回语句的值
let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

//闭包的参数可以使用数字来代替
let sortedNumbers = numbers.sorted{$0 > $1}
print(sortedNumbers)

//MARK: - Objectes and Classes
///对象和类
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//使用init函数来初始化对象
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//使用deinit来处理对象释放前的尾后工作(相当于C++中的析构函数)
//继承在类名后面添加:,Swift中的类不需要继承根类，子类重写父类的方法使用override关键字

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        //初始化子类成员变量
        self.sideLength = sideLength
        
        //初始化父类成员变量
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())


class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    //属性(get和set方法)
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        //默认参数为newValue，可以显式指定参数名
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


//如果不想使用属性修改实例变量，则可以使用willSet和didSet方法实现(KVO，实例变量的监听)
class TriangleAndSquare {
    //实例变量
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    //实例变量
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


//MARK: - Enumerations and Structures
///Enumerations and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print(aceRawValue)

let ace1: Rank = .ace
print(ace1.rawValue)

//使用init?(rawValue:)初始化方法来获取枚举成员
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(convertedRank)
}

print(Rank.ace)

//枚举类型的case value(系统默认提供)为枚举成员的真值，与rawValue是不一样，rawValue并没有意义，不提供rawValue也是可以的。
enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
print(hearts)


//结构体与类的最重要的区别是：作为参数传递的时候，结构体是值传递，类是引用传递
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription()))"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//枚举成员可以拥有与之关联的值(关联值)，关联值与rawValue不一样，相同的枚举成员rawValue是一样的，但是关联值不一定一样
enum ServerResponse {
    case result(String, String)
    case error(String)
}

let success = ServerResponse.result("6:00 am", "8:00 pm")
let failure = ServerResponse.error("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .error(error):
    print("Failure...\(error)")
}

//MARK: - Protocol and Extensions
///Protocol and Extensions
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//类、枚举、结构体都可以遵循协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//注意，在结构体中使用mutating关键字来标记方法修改了结构体成员变量的值，类中不需要
//使用extension来给现有类型增加函数能力，例如新方法或者计算属性等。还可以使用extension为声明在其他地方的类型添加遵循的协议，甚至可以对从其他framework或者库中导入的类型做上述操作。

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)


//协议可以和其他类型一样使用，比如指定容器中的元素都遵循协议。当使用协议类型时，除了协议定义的方法，其他方法都是不可访问的。
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

//即使protocolValue的运行时类型为SimpleClass，编译器只把它当做遵循了ExampleProtocol协议的类型

//MARK: - Error Handling
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

//错误处理的几种方式
//1.使用do-catch来处理
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

//使用多层catch来捕捉特定的错误
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just pull this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//2.另外一种方式是使用try?将结果转换成可选类型
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

//不管函数抛不抛出异常，defer块中编写的代码在函数里面的其他代码执行完毕后再执行。可以在defer块中
//编写初始化或者清理操作相关的代码。
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print("fridgeIsOpen: \(fridgeIsOpen)")


//MARK: - Generics
///Generics
func repeatItem<Item>(_ item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0 ..< numberOfTimes {
        result.append(item)
    }
    return result
}
print(repeatItem("knock", numberOfTimes: 4))


//函数、方法、类、枚举、结构体都可以使用泛型

//Swift标准库实现的可选类型
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: Optional<Int> = .none
possibleInteger = .some(100)

//在类型名称的后面使用where来指定一系列的要求，例如要求类型实现某个协议，要求两个类型为相同类型，要求一个类有特定的父类
func anyCommonElements <T: Sequence, U: Sequence> (_ lhs: T, _ rhs: U) -> Bool where
    T.Iterator.Element: Equatable,
    T.Iterator.Element == U.Iterator.Element {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
let result = anyCommonElements([1, 2, 3, 4], [3])
print(result)

//<T: Equatable>与<T where T: Equatable>效果相同
