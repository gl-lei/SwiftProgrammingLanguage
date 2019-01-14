//
//  main.swift
//  Inheritance
//
//  Created by gl on 16/9/8.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Inheritance(4.2)

import Foundation

//MARK: - Inheritance

//MARK: - Defining a Base Class
//Swift中的类可以不用继承任何通用的类。
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("Vehicle makeNoise")
    }
}

//MARK: - Subclassing
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

//MARK: - Overriding
//子类可以提供自己实现的实例方法、类方法、实例属性、类属性或者下标操作，这被称之为重写。
//使用override关键字来重写方法

//MARK: - Accessing Superclass Methods, Properties, and Subscripts
//访问父类的实现使用super关键字。
//super.someMethod(), super.someProperty, super[someIndex]

//MARK: - Overriding Methodss
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()

//MARK: - Overriding Properties
//我们可以通过提供自己版本的属性的getter和setter来重写继承来的实例属性或者类型属性，或者添加属性观察者到这些重写的属性上面。

//MARK: - Overriding Property Getter and Setter
//我们可以为继承来的属性提供自定义的getter和setter方法，而不用管继承来的属性是存储属性还是计算属性，因为我们只知道属性的名字和类型。在重写中，我们必须保持重写后的属性的名称和类型与继承来的属性一致。我们可以将父类的只读属性重写为可读可写的属性，但是不能将父类的可读可写属性重写为可读属性。
//如果我们重写了父类属性的setter，那么我们必须要提供重写的getter。如果不想重写getter方法，则直接返回super.someProperty
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

//MARK: - Overriding Property Observers
//我们可以使用属性重写来为继承来的属性添加属性观察者，而不管继承的属性是如何实现的。
//我们不可以对继承来的常量存储属性或者只读计算属性添加属性观察者。这些属性的值都是不能被设置的，因此提供willSet和didSet的重写实现也是不合理的。
//此外，我们不能够为同一个属性同时提供重写的setter和重写的属性观察者。因为如果你想要观察属性值的变化，你完全可以在重写的setter方法里面进行观察。
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

//MARK: - Preventing Overrides
//通过把方法、属性或者下标操作标识为final，则可以阻止方法、属性和下标被子类重写。
//从Extension中添加的属性、方法、下标都可以标识为final，整个类也可以被标识为final
