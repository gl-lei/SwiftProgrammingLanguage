//
//  main.swift
//  Extensions
//
//  Created by gl on 2017/1/23.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Extensions(5.0)

import Foundation

//swift中的扩展与OC里面的分类很像(swift的扩展没有名字)

//扩展可以做这些：
//1.添加计算属性和计算类型属性(类方法)
//2.定义实例方法和类方法(类方法)
//3.提供新的初始化方法
//4.定义下标操作
//5.定义和使用新的嵌套类型
//6.遵循协议

//可以在Extension中实现协议的要求方法
//需要注意，扩展不能重写已经存在的方法
//为存在的类型通过扩展添加了一些函数，那么这些函数能够在已经存在的实例上面使用，即使这些实例是在定义扩展之前被创建的。
//还可以对泛型进行扩展

//MARK: - Computed Properrties
extension Double {
    var km: Double {
        return self * 1_000.0
    }
}
//扩展可以添加新的计算属性，但是它们不能添加存储属性或者对当前存在的属性添加属性观察者。

//MARK: - Initializers
//扩展能够给类添加新的便利初始化方法，但是不能给类添加指定初始化方法或者析构方法。指定初始化方法和析构方法必须由原类实现文件提供。
//如果是值类型，则在扩展定义的初始化方法中可以使用值类型的默认初始化方法或者memberwise方法。
struct Size {
    var width = 0.0, height = 0.0
}

extension Size {
    init(width: Double) {
        self.init(width: width, height: 10.0)
    }
}
let size = Size(width: 100)
print(size)

//MARK: - Methods
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("Hello!")
}

//MARK: - Mutating Instance Methods
//通过扩展添加的实例方法同样可以修改(或者转变)实例变量本身。如果是结构体或者枚举类型的方法需要修改self的话，则需要在方法上面使用mutating标识。
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

//MARK: - 下标操作
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
print(838283[0])

//MARK: - Nested Types
//扩展还可以给类类型、结构体和枚举类型添加新的嵌套类型
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
