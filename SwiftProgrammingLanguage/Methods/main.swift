//
//  main.swift
//  Methods
//
//  Created by gl on 16/9/8.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Methods(4.2)

import Foundation

//MARK: - Methods
//Swift中，类、结构体、枚举都可以定义实例方法，也可以定义类方法。

//MARK: - Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

//方法参数都有一个名称和一个参数标签，就和函数一样

//MARK: - The self Property
//类型实例方法中都有一个隐含的属性self，它代表当前实例本身。通常情况下我们不用去写self本身，直接写属性就可以了。只有当参数的名称与属性的名称一样的时候，我们才不得不使用这种方式来区分属性和参数。
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

//MARK: - Mofifying Value Types from Within Instance Methods
//结构体和枚举都是值类型，值类型的属性在实例方法内默认不能被修改的。如果想要修改的话，需要使用mutating来修饰方法，这样方法就可以修改属性值了。甚至可以将一个新的实例赋值给self属性，这样这个新的实例将取代旧实例。
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)

//需要注意，不能使用常量实例来的调用mutating修饰的方法，因为常量实例的属性都是不能被改变的。

//MARK: - Assigning to self Within a Mutating Method
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

//MARK: - Type Methods
//类方法，使用static或者class(类才可以使用，子类可以继承重写)关键字来定义类方法。
//在类方法里面，self属性表示的是类型本身而不是类型的实例。在结构体和枚举来说，这意味着你可以使用self来区分类型属性和类型方法的参数(同名的时候)。
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

//@discardableResult的意思是忽略不使用返回值的警告
