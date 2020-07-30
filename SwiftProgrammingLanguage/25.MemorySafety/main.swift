//
//  main.swift
//  Memory Safety
//
//  Created by ggl on 2019/1/5.
//  Copyright © 2019年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Memory Safety(5.0)

import Foundation

//swift默认会阻止我们代码中不安全的行为。例如swift会确保变量在被初始化之后才可以进行操作；变量释放后确保不能访问它们的内存；检查数组索引以防止发生数组越界错误；
//通过修改内存中某个位置的代码来以互斥访问该内存，swift同样确保了对同一内存区域的多个访问不会发生冲突；因为swift会自动管理内存，大多数情况下我们都不需要关心如何访问内存。然而，我们需要知道如何在写代码中避免发生潜在的访问内存冲突。如果我们代码中有这些冲突，我们会得到编译错误或者运行错误。

//MARK: - Understanding Conflicting Access to Memory
//当我们给变量赋值或者给函数传递参数的时候，将会访问内存。例如下面的代码：

//给one变量赋值的时候，需要访问one变量的内存
var one = 1

//打印one变量的值得时候，需要访问one变量的内存
print("we're number \(one)")

//当不同部分的代码在同一时间都尝试访问内存中的同一位置时，可能会发生对内存的访问冲突；
//在swift中，有些方式可以持续在几行代码中来一直修改变量的值。这就让在修改变量的过程中访问变量的值成为可能；
//需要注意，我们这里所说的访问冲突是在单线程中发生的问题，不涉及到多线程。虽然多线程中也会发生这样的问题；在单线程中发生访问内存冲突，swift会保证我们在编译或者运行过程中得到错误信息；

//MARK: - Characteristics of Memory Access
//这里有典型的三种内存访问场景被认为是内存访问冲突：无论访问是读还是写，在访问的持续时间中，都会访问内存中的位置。具体来说，如果有两个访问满足以下所有条件，则会发生冲突：
//1.至少有一个访问是写
//2.它们访问内存中的相同位置
//3.访问内存的持续时间有重叠(overlap)

//内存访问持续时间要么是瞬间的，要么是持续的（long-term）。两个瞬间内存访问是不会发生冲突的，大多数内存访问都是瞬间的。例如下面的代码：
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

//然而这里有几种内存访问是持续的（long-term），这种内存访问会跨越其他代码的执行。瞬间访问和持续访问的区别就是：持续访问开始后，在它未结束之前，其他代码是有可能运行的，这叫做overlap。持续访问与其他的持续访问或者瞬间访问都是可能重叠的（overlap）
//持续访问主要出现在使用in-out参数的函数、方法中，或者是结构体的mutating方法中。

//MARK: - Conflicting Access to In-Out Parametes
//函数对它的所有的in-out参数都拥有持续写访问。对in-out参数的写访问在所有的非in-out参数都赋值完成之后开始,一直持续到函数调用结束.如果函数有多个in-out参数,对参数的写访问会按照参数的先后顺序来进行;
//持续写访问的一个后果是:我们无法访问作为in-out参数传递的原变量,即使作用域规则和访问控制会允许访问原变量。这时候,任何对原变量的访问都会产生冲突.例如:
var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}

increment(&stepSize);
//error: conflicting accesses to stepSize

//下面是一种解决方式：对stepSize进行copy
var copyOfStepSize = stepSize
increment(&copyOfStepSize)

//update the original
stepSize = copyOfStepSize

//持续写访问的另一个后果是:对函数的多个in-out参数传递单个变量将会产生冲突。例如：
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)       //OK
balance(&playerOneScore, &playerOneScore)
//Error: conflicting accesses to playerOneScore

//MARK: - Conflicting Access to self in Methods
//结构体的mutating方法在方法的调用过程中，对self有一个持续写访问；例如：
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}
var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)

//上面代码是完全可以的，没有产生冲突，但是如果是下面的代码：
oscar.shareHealth(with: &oscar)
//Error: conflicting accesses to oscar

//MARK: - Conflicting Access to Properties
//像结构体、元组、枚举类型这样的类型都是由不同的值组合而成的。因为这些类型都属于值类型，对值类型里面值的修改就是对整个值类型的修改。这也就意味着对值类型里面属性的读、写访问，也就是对整个值类型的读、写访问；例如，下面对元组元素的写访问就产生了冲突：
var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy)
//Error: conflicting access to properties of playerInformation

//下面对结构体的属性访问也是错误的
var holly  = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy)       //Error

//实际上，对结构体属性的大多数访问都是可以安全的重叠。例如，如果在上面示例中的holly更改为局部变量而不是全局变量，编译器可以证明对结构的存储属性的重叠访问是安全的。
func someSafeAccessFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}

//在上面的例子中，编译器可以保证内存安全，因为对两个存储属性的访问根本不会有任何交集；
//为了保证内存安全，对结构体属性的重叠访问的限制并不总是必要的。内存安全是所必须要的保证，互斥访问一定能够确保内存安全，但内存安全不一定需要使用互斥访问来实现；也就是说，只要能够保证内存安全，即使是违反了互斥访问的规则也是可以的；如果编译器能够证明对内存的非互斥访问仍然能够保证内存安全，那么这些代码也是可以使用的；具体来说，如果满足以下所有条件，就可以证明对结构体属性的重叠访问是安全的：
//1.访问的是结构体的存储属性，而非计算属性或类属性；
//2.结构体是局部变量，而不是全局变量；
//3.结构体要么不被任何闭包持有，要么只被nonescaping闭包持有；
//如果编译器不能够证明访问是安全的，那么仍然不允许访问；
