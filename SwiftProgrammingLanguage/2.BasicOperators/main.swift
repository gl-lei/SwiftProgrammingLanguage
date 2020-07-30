//
//  main.swift
//  Basic Operators
//
//  Created by gl on 16/8/13.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Basic Operators(5.0)

import Foundation

//Swift支持大多数标准C运算符并且提高了常见代码错误的处理能力，比如赋值运算表达式不会有返回值(避免当成==来使用)，算术运算符不支持值溢出，取余(%)运算符支持浮点类型，还提供了C语言所不具有的范围运算符(..<和...)。

//MARK: - Assignment Operator
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)     //x等于1，y等于2

//Swift中的赋值运算符不返回一个值，主要是为了避免误将“=”用为“==”，下面的语句是不正确的
//if x = y {
//    print("x is equal to y!")
//}

//MARK: - Arithmetic Operators
//算术运算符包括+、-、*、/，Swift中算术运算符不允许值溢出，String类型可以使用加号运算符。
let str = "Hello" + "World"

//MARK: - Remainder Operator
//取余运算符，取余运算的结果的正负和第一个运算数的正负结果一致，求模运算的结果的正负与第二个运算数的正负结果一致。
let result = -9 % 4             //-9 = (4 x -2) + -1

//MARK: - Compound Assignment Operators
var a12 = 1
a12 += 2
print(a12)

//注意，混合运算符没有返回值
//let bbbb = a12 += 12

//MARK: - Comparison Operators
//相等==、不相等!=、大于>、小于<、大于等于>=、小于等于<=还有===和!==用来判断两个对象是否引用的是同一个对象，而不是对象的值是否一样。
let name = "world"
if name == "world" {
    print("hello world");
} else {
    print("I'm sorry \(name), but I dont't recognize you")
}

//元组如果拥有的类型一样并且数量也一样的话，也可以进行比较。比较准则是从左往右依次进行比较。
("blue", -1) < ("purple", 1)        // OK, evaluates to true
("blue", false) < ("purple", true)  // Error because < can't compare Boolean values

//注意，swift标准库要求元组的元素个数只有小于7个的时候才可以进行比较，大于或者等于7个的话则不能进行比较。我们只能自己实现比较方法来进行比较。

//MARK: - Ternary Conditional Operator
//三目运算符
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//MARK: - Nil Coalescing Operator
//空值解包合并运算符(a ?? b)用来解包optional变量a，如果a包含一个值，则返回解包后的值。如果a的值为nil，则返回b。表达式b必须与a所含值的类型一致。
// a != nil ? a! : b        如果a的值不为nil，则b表达式不会进行计算。

//MARK: - Range Operators
//范围表达式，包括闭范围运算符(...)和半开范围运算符(..<)，闭范围运算符包括两边的数据，半开范围运算符只包括左边的数据。
for index in 1...5 {
    print(index)                //打印1到5
}

for index in 1..<5 {
    print(index)                //打印1到4
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//单边范围运算符
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

//MARK: - Logical Operators
//逻辑运算符包括!(逻辑非)、&&(逻辑与)、||(逻辑或)
//需要注意的是如果逻辑与的第一个表达式为假，则第二个表达式不进行计算。逻辑或的第一个表达式为真，则第二个表达式就不进行计算了。
