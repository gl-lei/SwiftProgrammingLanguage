//
//  main.swift
//  Protocols
//
//  Created by gl on 2017/1/23.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Protocols(5.0)

import Foundation

//MARK: - Property Requirements
//协议可以通过定义一个属性名和类型来要求任何遵守协议的类型提供实例属性或者类型属性。但协议不会指定属性应该被实现为存储属性或者类型属性-它仅仅指定了需要实现的属性名和属性类型。协议也可以指定每个属性必须提供getter和setter。

//协议中的属性要求一般被声明为变量属性(使用var关键字)，getter和setter用{get set}来表示。
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

//当在协议中定义类型属性的时候，需要使用static前缀。(虽然在类实现中可能会使用static或者class关键字)
protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}

//MARK: - Method Requirements
//协议可以要求指定的实例方法或者类型方法，让遵守协议的类实现。这些方法作为协议的一部分，但是没有实现部分。可变参数是可以的，但是默认值是不可以的。
//当定义类方法时候，需要使用static前缀。(类遵循协议的时候，可以使用static或者class)
protocol SomeProtocol1 {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

//MARK: - Mutating Method Requirements
//当想让协议中声明的方法可以修改实例的时候，使用mutating关键字标识方法。类实现此协议方法的时候可以不用写mutating关键字，结构体和枚举类型需要写上。

//MARK: - Initializer Requirements
protocol SomeProtoco2 {
    init(someParameter: Int)
}

//MARK: - Class Implementations of Protocol Initializer Requirements
//可以用指定初始化方法或者便利初始化方法来实现，不过必须要加上required关键字
class SomeC: SomeProtoco2 {
    required init(someParameter: Int) {
        //添加实现
    }
}

//当类用final修饰的时候，我们在实现协议指定的初始化方法的时候，就不需要添加required了。因为final类不能被继承
//如果子类继承自父类，又要重写协议中指定的初始化方法，则需要用同时使用override和required。

//MARK: - Failable Initializer Requirements
//协议可以指定可失败的初始化方法，遵守协议的类可以使用可失败的初始化方法或者不可失败的初始化方法实现。协议中不可失败的初始化方法可以使用不可失败的初始化方法或者隐式解包可失败的初始化方法实现。

//MARK: - Protocol as Types
//协议可以作为类型来使用：
//1.在函数或者方法、初始化方法里面作为参数或者返回值
//2.作为常量、变量或者属性的类型
//3.作为数组、字典或者其他容器类型的元素类型

//协议因为是类型，所以以协议名称以大写字母开头，就和Int、String一样。
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

//MARK: - Delegation
//一种iOS种经常使用的设计模式
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}
//遵循AnyObject的协议都属于Class-Only协议，只有类才可以遵循的协议。Delegate需要使用weak修饰

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

//MARK: - Adding Protocol Conformance with an Extension
//我们可以使用extension的形式来让某个类遵循新的协议，即使我们不能访问到当前类型的源代码。
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sides dice"
    }
}

//MARK: - Conditionally Conforming to a Protocol
//通过使用where，泛型在某些情况下可以满足协议的一些要求
//下面的数组里面的元素表示都遵循了TextRepresentable协议
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

//MARK: - Declaring Protocol Adoption with an Extension
//如果一个类型早已遵循了一个协议的所有要求，但是没有遵循协议。我们可以使用空的Extension来遵循这个协议。
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

//MARK: - Collections of Protocol Types
//数组或者字典中可以存储遵循了协议类型的元素
let things: [TextRepresentable] = [game, d12, dimonTheHamster]
for thing in things {
    print(thing.textualDescription)
}

//MARK: - Protocol Inheritance
//语法与类继承类似
protocol InheritingProtocol: SomeProtocol, SomeProtoco2 {
    
}

//MARK: - Class-Only Protocols
//通过继承AnyObject协议，可以将协议只对类类型开放，结构体和枚举类型不能遵循这种协议；
protocol SomeClassOnlyProtocol: AnyObject {
    //class only protocol definition goes here
}

//MARK: - Protocol Composition
//一个类型可能遵循了多个协议，通过使用协议组合可以表示多个协议
//语法：SomeProtocol & AnotherProtocol
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

//MARK: - Checking for Protocol Conformance
//我们可以使用is和as来检测协议的类型关系，并可以转换为特定类型；检测和转换协议类型与检测和转换其他类型一样：
//1.如果实例遵循了一个协议，则使用is操作符返回true，否则返回false
//2.as?操作符转换为可选指定协议类型，如果实例不遵循这个协议的话，则可选类型的值为nil
//3.as!操作符强制转换为指定协议类型，如果转换失败的话，则会触发运行错误
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

//MARK: - Optional Protocol Requirements
//在协议中可以使用@optional来定义属性或者方法，这些都可以不需要实现的；通过使用@optional可以让协议的要求作为可选实现，从而可以与Objective-C进行交互；使用@optional的话，协议和协议要求上都必须使用@objc属性修饰；被@objc修饰的协议只能是继承自Objective-C类的类型或者继承自其他被@objc属性修饰的类型；
//当使用可选实现的方法或者属性的时候，它的类型会自动转换为可选类型。比如(Int) -> String 变为 ((Int) -> String)?.整个函数都是可选类型，而不是返回值类型是可选类型；
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


//MARK: - Protocol Extensions
//协议类型可以采用扩展的形式对遵循协议的实例提供方法、初始化方法、下标操作方法和计算属性的实现。这可以直接在协议中定义实现，而不是在每个实例中定义；
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

//MARK: - Providing Default Implementations
//我们可以使用协议扩展对协议要求的任意方法或者任意计算属性提供默认实现。如果遵循协议的实例对象实现了这些方法或者计算属性，则以实例对象中的方法或者计算属性为准；
extension HasArea {
    var area: Double {
        return 0
    }
}

//MARK: - Adding Constraints to Protocol Extensions
//当我们定义协议扩展的时候，我们可以对协议中的方法或者协议增加一些约束条件，所有遵循协议的实例对象都必须满足约束条件才可以使用协议中定义的方法或者属性；通过在协议名称的后面使用泛型where分句来增加约束条件；
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]
print(equalNumbers.allEqual())
print(differentNumbers.allEqual())

//注意，如果遵循协议的实例对协议的多个约束扩展都满足了要求，并且对相同的方法或者属性提供了多个实现；那么swift将以对应最多约束的属性或者方法实现为准；
