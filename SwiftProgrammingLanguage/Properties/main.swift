//
//  main.swift
//  Properties
//
//  Created by gl on 16/9/7.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Properties(4.2)

import Foundation

//MARK: - Properties
//类、结构体和枚举都可以定义属性。存储属性用来存储实例的常量或者变量的值，计算属性用来对存储属性进行操作而不是存储。
//类、结构体和枚举都可以定义计算属性，但是只有类和结构体才可以定义存储属性。
//可以为类型自身定义存储属性和计算属性(Type Properties)
//另外，我们可以定义属性观察者来观察属性值的改变。属性观察者可以加在类型自身的存储属性上面，也可以加在从父类继承来的属性上面。

//MARK: - Stored Properties
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//FixedLengthRange拥有一个变量firstValue的存储属性和常量length的存储属性。

//MARK: - Stored Properties of Constant Structure Instance
//如果将结构体实例赋值给一个常量，那么即使结构体实例里面的存储属性是变量也不能修改值。
let rangeOfFourItem = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItem.firstValue = 6 //在编译时会报错

//这种行为的原因是因为结构体属于值类型。引用类型就与之不同，引用类型仍然可以改变变量存储属性的值。

//MARK: - Lazy Stored Properties
//懒存储属性的初始化不会计算，直到第一次使用的时候。使用lazy关键字来表明一个存储属性为懒存储属性。懒存储属性必须为变量。
class LazyClass {
    var name = "Good"
    lazy var sex = "female"
}

//注意：标识为lazy的存储属性被多个线程同时访问的时候，不保证只会初始化一次。

//MARK: - Stored Properties and Instance Variables
//在OC中，提供了两种方式来存储值。一种是通过定义属性(属性对应着实例变量)，另外一种是直接定义实例变量。
//Swift将这些结构统一归结到单条属性声明中。Swift中的属性没有对应的类实例变量，并且属性底层的实例变量无法直接访问。所有的关于属性的信息：名称、类型、内存管理特性都被定义到这单条属性声明中。

//MARK: - Computed Properties
//类、结构体以及枚举都可以定义计算属性，计算属性不会提供存储值，它提供getter方法和一个可选的setter方法来直接返回和间接设置其他属性的值。
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("squre.origin is now at (\(square.origin.x), \(square.origin.y))")

//MARK: - Shorthand Setter Declaration
//如果计算属性没有为将要设置的新值定义一个名字，默认的newValue名字将会被使用。
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//MARK: - Read-Only Computed Properties
//只有getter没有setter的计算属性被称为只读计算属性，只读计算属性通过.操作访问，但是不能设置新值。
//需要注意，计算属性都必须标识为var。因为计算属性的值不是固定的。let只能用在常量存储属性上面，来表示它们的值在初始化之后就不能再被修改。
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

//MARK: - Property Observers
//属性观察者观察并且响应属性值的变化。每当属性的值发生变化，属性观察者就会被调用，即使属性的新值与当前的值一样也不例外。
//除了懒存储属性之外，我们可以添加属性观察者到定义的任何存储属性上。
//在子类中可以添加属性观察者到任何继承的属性上面(无论是存储属性还是计算属性)。
//对于计算属性，我们不需要定义属性观察者。因为我们可以在计算属性的setter方法里面观察和响应值的变化。

//willSet会在值设置之前调用，可以为新值起一个名字，如果没有的话则默认为newValue。
//didSet会在值设置之后调用，可以为旧值起一个名字，如果没有的话则默认为oldValue。
//注意，如果父类的初始化方法调用之后，在子类的初始化方法中设置继承自父类的属性的时候，父类的属性所对应的willSet和didSet观察者会被调用。
class StepCounter {
    var totalSteps: Int = 0 {
        willSet (newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//MARK: - Global and Local Variables
//存储属性和计算属性对于全局变量和局部变量同样适用。
//全局变量和局部变量被称为存储变量。存储变量与存储属性类似，它为类型提供存储空间并且允许设置和返回类型值。
//然而，我们同样可以在全局或者局部作用域中定义计算变量，并且可以为存储变量定义观察者。计算变量用来计算而不是存储，与计算属性的写法一样。
//全局常量和变量都采用懒加载的方式，与懒存储属性一样。不一样的地方是，全局变量和常量前面不需要加lazy标识。局部变量和常量永远不能懒加载。

var storeVariable = 34 {
    willSet {
        print("storeVariable 's newValue is \(newValue)")
    }
    
    didSet {
        print("storeVariable's oldValue is \(oldValue)")
    }
}

var computedVariable: Int {
    get {
        return storeVariable - 2
    }

    set {
        storeVariable = newValue
    }
}

//MARK: - Type Properties
//我们可以为类型本身定义属性。这种属性被称为类型属性。
//存储类型属性可以是变量或者常量，计算类型属性只能是变量。
//需要注意的是，存储类型属性需要初始值。这是因为类型本身是没有初始化方法的，不能给类存储属性赋初始值。存储类型属性总是懒初始化的，它们会确保只加载一次，在多线程环境下也是如此。此外，不需要使用lazy关键字来显式的进行标识。

//MARK: - Type Property Syntax
//使用static关键字来定义类型属性，对于类类型的计算存储属性来说，你可以使用class关键字代替static关键字来允许子类重写父类的实现。
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

//MARK: - Querying and Setting Type Properties
print(SomeStructure.storedTypeProperty)

SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
