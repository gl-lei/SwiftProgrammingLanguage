//
//  main.swift
//  Enumeations
//
//  Created by gl on 16/9/7.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Enumerations(4.2)

import Foundation

//MARK: - Enumerations
//枚举类型定义了相同类型之间有关联的值集合。
//Swift中的枚举类型是第一类类型，他们采用了很多被类支持的特性，例如计算属性、实例方法、初始化函数、可以扩展它们原有的实现，可以遵循协议等。

//MARK: - Enumeration Syntax
enum CompassPoint {
    case North
    case South
    case East
    case West
}

//和C语言不同, Swift的枚举值不会带有默认的整型值。

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
var directionToHead = CompassPoint.West
directionToHead = .North

//MARK: - Matching Enumeration Values with a Switch Statement
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguns")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

//如果所有的情况都不匹配，可以使用default来匹配其他的情况
let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

/*
//MARK: - Iterating over Enumeration Cases
//对许多枚举来说，有时候需要获得所有的枚举值的集合。在枚举类型前面遵循CaseIterable协议就可以通过allCases属性获得所有枚举值的集合
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoice = Beverage.allCases.count
print("\(numberOfChoice) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}*/

//MARK: - Associated Values
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

//如果关联值全部为常量或者变量，则可以直接将let前置在case前面。
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
}

//MARK: - Raw Values
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
//上面的字符都取自ASCIIControlCharacter中
//原值(Raw Values)可以是字符串类型、字符类型或者整型、浮点型类型。枚举类型中的每个值的原值都必须唯一。
//原值与关联值不同，当在定义枚举类型的时候，原值就是被预设好的。不同的枚举值拥有不同的原值，相同的枚举值拥有相同的原值。关联值与之不同，关联值是在使用枚举值创建变量或者常量的时候带有的，相同的枚举值可以带有不同的关联值。

//MARK: - Implicitly Assigned Raw Values
//当我们指定枚举类型为整型或者字符串类型的时候(原值为整型或者字符串类型)，我们不需要显式的为每个枚举值赋一个原值，Swift会自动帮我们赋值。
//对于整型原值来说，每一个枚举值的原值都是前一个枚举值原值的增1，如果第一个枚举值的原值没有指定的话，则它的原值为0
enum Planet1: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
print("Venus的原值为: \(Planet1.Venus.rawValue).")
print("Mercury的原值为: \(Planet1.Mercury.rawValue)")

//当使用字符串来作为枚举类型的原值的时候，默认每个枚举值的原值是枚举值的名字字符串。
enum CompassPoint1: String {
    case North, South, East, West
}
print("North的原值为：\(CompassPoint1.North.rawValue).")

//MARK: - Initializing from Raw Value
//如果我们使用原值类型来定义枚举类型，那么枚举类型会自动接收一个以原值作为参数的初始化函数，参数名称为rawValue。函数返回一个枚举值或者nil。我们可以使用这个初始化函数来获取枚举值。
let possiblePlant = Planet1(rawValue: 7)

if let plant = possiblePlant {
    print("plant的原值为: \(plant.rawValue).")
}

//MARK: - Recursive Enumerations
//递归枚举是一种以自身枚举类型值作为当前枚举值的关联值的一种枚举类型。通过插入indiret来表示一个枚举值是递归枚举值
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//我们也可以将indirect写在枚举类型的外面
indirect enum ArithmeticExpression1 {
    case Number(Int)
    case Addition(ArithmeticExpression1, ArithmeticExpression1)
    case Multiplication(ArithmeticExpression1, ArithmeticExpression1)
}

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))

