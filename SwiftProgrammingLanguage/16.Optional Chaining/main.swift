//
//  main.swift
//  Optional Chaining
//
//  Created by gl on 2017/1/23.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Optional Chaining(5.0)

import Foundation

//MARK: - Optional Chaining as an Alternative to Forced Unwrapping
//我们通过将？放置在可选类型的后面来调用属性、方法或者下标。如果可选类型不为nil的话，将！放置在Optional值得后面来强制解包Optional的值也是一样的。它们之间最大的不同是：如果可选类型为nil的话，强制解包将会引发异常，而optional链会返回nil.

//可选类型调用链返回结果总是是可选类型，即使属性、方法、下标的返回值不为可选类型也会这样；

//MARK: - 可选链调用方法
//方法没有指定返回值，然而，没有返回值的函数或者方法都有隐式的返回值类型Void。这意味着它们返回一个()值或者一个空元组。如果用Optional链调用了这个方法，则方法的返回值为Void?
//下标操作：john.residence?[0] = Room(name: "BBBB") (放置在[]的前面)
//方法操作：john.residence?.address?.buildingIdentifier()?.hasPrefix("TEST")

//多重链接的规则：
//1. 如果访问的返回值类型不是Optional类型，则它将变为Optional类型。
//2. 如果访问的返回值类型已经是Optional类型，则不会变为多重Optioonal类型，还是会返回Optional类型。

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72


