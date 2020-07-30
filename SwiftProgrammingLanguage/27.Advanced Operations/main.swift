//
//  main.swift
//  Advanced Operators
//
//  Created by ggl on 2019/1/11.
//  Copyright © 2019年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Advanced Operators (5.0)

import Foundation

//MARK: - Bitwise Operators
//位操作运算可以操作数据结构的位数据，经常用在低水平的编程中，例如图像编程和设备驱动程序。

//MARK: - Bitwise NOT Operators
//位取反操作
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits     // equlas 11110000

//MARK: - Bitwise AND Operators
//位与操作符
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits     // equals 00111100

//MARK: - Bitwise OR Operators
//位或操作符
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits      // equals 11111110

//MARK: - Bitwise XOR Operators
//位异或操作符
let firstBitsX: UInt8 = 0b00010100
let otherBitsX: UInt8 = 0b00000101
let outputBits = firstBitsX ^ otherBitsX    // equals 00010001

//MARK: - Bitwise Left and Right Shift Operators
//位左移操作符（<<）位右移操作符（>>）;移动整数的位，如果往左移一位，整数的值将翻倍，往右移动一位，则整数的值变为原来的1/2;

//MARK: - Shifting Behavior for Unsigned Integers
//对无符号整数的左移和右移操作规则
//1.现存的位数往左或者往右移动指定字数的位；
//2.任何超出整数存储位数的位，都将被忽略；
//3.位移多出的位用0填充；

//MARK: - Shifting Behavior for Signed Integers
//对有符号整数的左移和右移操作规则

//有符号左移规则
//1.现存的位数往左移动指定字数的位；
//2.任何超出整数存储位数的位，都将被忽略；
//3.位移多出的位用0填充
//4.符号位不变

//有符号右移规则
//1.现存的位数往右移动指定字数的位；
//2.任何超出整数存储位数的位，都将被忽略；
//3.位移多出的位用符号位填充
//4.符号位不变

//MARK: - Overflow Operators
//swift默认是不允许值溢出的，如果值溢出的话会报错
var potentialOverflow = Int16.max
potentialOverflow += 1          // this causes an error

//可以使用溢出操作符（&+、&-、&*）

//MARK: - Value Overflow
var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1        // unsignedOverflow is now equal to 0

//MARK: - Precedence and Associativity
//优先级和结合性
var result = 2 + 3 % 4 * 5
print("result = \(result)")         // this is equal 17

//swift的运算符优先级以及结合性规则比C语言和OC语言简单的多。然而，这也意味着与基于C语言的编程语言规则不尽相同。在swift中使用的时候需要多加注意，确保与我们所想的一致；

//MARK: - Operator Methods
//类和结构体可以重载运算符（运算符重载）

//MARK: - 二元运算符重载（两个操作数）
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

//MARK: - Prefix and Postfix Operators
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

//MARK: - Compound Assignment Operators
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

//需要注意，赋值运算符不能进行重载，三目运算符也不能被重载

//MARK: - Equivalence Operators
//默认情况下，自定义类类型和结构体都没有相等运算符（==）和不相等运算符（!=）。如果需要重载相等运算符和不相等运算符，需要遵循Equatable协议，并实现相应方法
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

//如果我们实现了相等运算符操作，则不需要再实现不相等运算符。swift会自动根据相等运算符的方法，取反生成不相等运算符方法；
let twoThree = Vector2D(x: 2.0, y: 2.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

//在多数简单场景，我们可以让swift自动帮我们生成Equivalence操作方法，swift会自动为满足以下规则的类型提供相应方法实现：
//*.结构体只存在存储属性，并且这些属性都遵循了Equatable协议；
//*.枚举类型只存在关联类型，并且这些类型都遵循了Equatable协议；
//*.枚举类型不存在任何关联类型

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}

//MARK: - Custom Operators
//除了swift的标准库类型，我们还可以声明和实现我们自己的自定义运算符;
//首先需要使用operator关键字在全局声明新操作符，并在前面用prefix、infix或者postfix修饰符标识；
prefix operator +++

//然后在类型中实现新操作符方法
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

//MARK: - Precedence for Custom Infix Operators
//每个自定义中缀（Infix）操作符都属于优先组，优先组指定操作符相对于其它中缀操作符的优先级以及结合性之间的关系
//未显示放置到优先组中的自定义中缀（Infix）操作符会放到一个默认的优先组中，其优先级会高于三目运算符的优先级；

//下面的例子定义了一个新的中缀操作符：+-，是属于AdditionPrecedence优先组
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)

//注意：在定义前缀和后缀操作符的时候，我们没有指定优先级。然而，如果对同一个操作数使用前缀和后缀操作符，那么首先执行的是后缀操作符；
