//
//  main.swift
//  Classes and Structures
//
//  Created by gl on 16/9/7.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Classes and Structures(4.2)

import Foundation

//MARK: - Classes and Structures
//Swift不要求我们去创建接口文件以及实现文件，而是仅仅只需要一个文件。
//Swift中的类和结构体在函数能力方面无比的接近。

//MARK: - Comparing Classes and Structures
//类和结构体的共同点：
//1. 定义属性来存储值
//2. 定义方法来提供函数能力
//3. 定义下标操作来通过下标语法来访问存储的值
//4. 定义初始化函数来初始化状态
//5. 可以被扩展
//6. 可以遵循协议

//类具有结构体所不具有的能力：
//1.继承可以让一个类获取另外一个类的能力
//2.类型转换可以让我们在运行时检查和了解类实例的真实类型
//3.析构函数可以让类实例释放所占用的资源
//4.引用计数可以使多个对象指向同一个类实例

//结构体在传递的时候总是进行拷贝的，而不会使用引用计数。

//MARK: - Definition Syntax
//定义类型的时候首字母大写，定义属性的时候首字母小写。
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//MARK: - Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

//MARK: - Accessing Properties
print("The width of someResolution is \(someResolution.width).")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width).")

//MARK: - Memberwise Initializers for Structure Types
//所有的结构体都有一个自动生成的逐一成员初始化函数(memberwise initializer).
let vga = Resolution(width: 640, height: 480)

//类没有这样的自动生成的逐一成员初始化函数

//MARK: - Structers and Enumerations Are Value Types
//值类型是一种当赋值给常量或者变量或者传递给函数的时候，值会发生拷贝的类型。实际上，Swift中的所有基本类型：整型、浮点型、布尔型、字符串类型、数组、字典都是值类型，实际底层都是采用结构体来实现的。
//Swift中所有的结构体类型和枚举类型也都是值类型，如果它们里面的属性也是值类型的话，则在操作它们的实例变量的时候，都会采用copy操作

var hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("The hd's width is \(hd.width).")

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.North
var rememberedDirection = currentDirection
currentDirection = .South
print("The rememberedDirection is \(rememberedDirection).")

//MARK: - Classes Are Reference Types
//和结构体类型不同，类是引用类型。在进行赋值的时候将不会发生拷贝。
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate of the tenEighty is now \(tenEighty.frameRate).")

var rate = tenEighty.frameRate
rate = 344
print("rate: \(rate), tenEighty's frameRate: \(tenEighty.frameRate)")

//MARK: - Identity Operations
//有可能存在多个常量或者变量指向同一个类实例，很多时候我们需要查明两个常量或者变量指向的是否是同一个类实例。Swift提供了两种身份验证操作符。
//相等(===) 不相等(!==)
//使用这两个操作符来检测两个常量或者变量是否指向同一个类实例。
if tenEighty === alsoTenEighty {
    print("They are refer to the same VideoMode instance.")
}

if rate == tenEighty.frameRate {
    print("rate is the same")
} else {
    print("rate is not the same")
}

//注意和equal to(==)进行区分

//MARK: - Pointers
//Swift中的常量或者变量指向类的实例与C语言中的指针类似，但是不是直接指向内存地址，而且不会要求你写*来表示你创建了一个指针，而是直接像Swift中的定义常量或者变量的方式来定义指针。

/*下面内容在swift4.2中已经被删掉
//我们可以使用类或者结构体来定义我们的数据结构，类传递采用引用的方式，结构体传递采用拷贝的方式，在项目开发中需要实际考虑我们的需求。

//对于什么时候使用结构体的有几条建议：
//1.结构体最主要的目的是封装少量的相对简单的数据值。
//2.当我们进行赋值或者传递封装数据的时候，如果考虑采用拷贝而不是引用的话，使用结构体。
//3.任何属性本身就是值类型存储的结构体，这也将会拷贝而不是引用。
//4.结构体不会从其他类型继承属性或者操作。

//实际上，绝大多数的数据结构类型都应该采用类而不是结构体。

//在Swift中，很多基本数据类型，例如字符串、数组和结构体都是采用结构体来实现的。这意味着在使用它们的时候，会发生拷贝。而Foundation框架中的NSString、NSArray和NSDictionary都是采用类来实现的，不是结构体，使用它们的时候不是拷贝，而是引用。
//Swift会做一些优化，只有当值真正发生变化的时候才会进行拷贝，否则会使用引用。
 */
