//
//  main.swift
//  Type Casting
//
//  Created by gl on 2017/1/23.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Type Casting(5.0)

import Foundation

//类型转换在swift中使用is和as操作符来表示

//MARK: - Checking Type
//使用is来检查一个实例变量是否属于所指定类型的子类类型(包括自身类型)

//MARK: - Downcasting
//使用as?和as!来进行类型的向下转换，转换有可能会失败。(转换不会修改实例自身的值)

//MARK: - Type Castiing for Any and AnyObject
//Any代表任何类型的实例，包含函数类型
//AnyObject代表任何类类型实例

//注意，Any类型代表任何类型，包括可选类型。如果函数期望得到一个any类型，你传递了一个Optional类型，则swift会提供一个警告。你可以使用as操作符来转换一下就可以了。

//在Enumeration中使用is或者as来匹配是否是指定类型

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}


//Any代表任何类型，也包含可选类型。当我们使用可选类型的数据传递给接收Any类型的数据时，swift会报警告
//如果执意将可选类型传递给接收Any类型的数据时，可以使用as操作符将可选类型强制转换为Any类型。
let optionalNumber: Int? = 3
things.append(optionalNumber)           //会有警告
things.append(optionalNumber as Any)    //没有警告
