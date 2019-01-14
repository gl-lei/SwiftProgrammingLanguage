//
//  main.swift
//  Automatic Reference Counting
//
//  Created by gl on 2017/1/22.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Automatic Reference Counting(4.2)

import Foundation

//自动引用计数只适合于类实例，结构体和枚举类型是值类型，不是引用类型，不是通过指针来引用和存储的。

//MARK: - How ARC Works
//通过强引用来实现

//MARK: - Strong Reference Cycles Between Class Instances
//强引用环
class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}
//形成强引用环
var john: Person? = Person(name: "John Appleseed")
var unit4A: Apartment? = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil
//上面即使我们将john和unit4A都置为nil，内存也是没法得到释放

//MARK: - Resolving Strong Reference Cycles Between Class Instance
//Swift提供了两种方式来解决强引用环：weak引用和unowned引用。weak和unowned引用不会形成strong引用；
//当所引用的实例有比较短的生命周期的时候，使用weak引用。例如上面的例子中，在公寓对象的生命周期中，是很有可能不存在租客的，所以这种情况下weak引用就比较合适。相反，当所引用的对象有相同的生命周期或者比本身还要长的生命周期的时候，使用unowned引用。

//MARK: - Weak References
//声明为weak引用的属性必须为可选类型，并且必须是变量。weak对象不拥有对象的所有权。
//当ARC将weak引用的属性置为nil的时候，不会调用属性的观察者。

class Person1 {
    let name: String
    var apartment: Apartment1?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

class Apartment1 {
    let unit: String
    weak var tenant: Person1?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}
var john1: Person1? = Person1(name: "John Appleseed")
var unit4A1: Apartment1? = Apartment1(unit: "4A")
john1!.apartment = unit4A1
unit4A1?.tenant = john1

john1 = nil
unit4A1 = nil

//MARK: - Unowned References
//和weak引用一样，unowned引用也是不会强引用所指向的对象。和weak引用不同的是，unowned引用所指向的对象的生命周期要比自身对象的生命周期长(或者相同)，这样，在unowned引用的时候，都是存在值的。ARC永远不会将unowned引用置为nil。
//只有在确保要引用的对象不会被释放才可以使用unowned引用。否则，如果要引用的对象被释放了的话，会触发运行时异常；
class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}
var j: Customer? = Customer(name: "John Appleseed")
j!.card = CreditCard(number: 1234_5678_9012_3456, customer: j!)
j = nil

//上面的代码展示了如何使用安全的unowned引用。当我们不需要使用运行时安全检查时，swift同样提供也提供了不安全的unowned引用，例如为了某些性能优化。当我们使用使用不安全的unowned引用时，我们就需要自己来确保代码安全性了。
//不安全的unowned这样使用：unowned(unsafe)
//当我们使用不安全的unowned引用时，如果引用的对象被释放了，引用会仍然指向那个对象内存地址，这是一种不安全的操作，可能会引发程序异常；

//MARK: - Unowned References and Implicitly Unwrapped Optional Properties
//上面Person和Apartment的例子，使用weak适用于两边的属性都可以为nil的情况；
//上面Customer和CreditCard的例子，使用unowned适用于一边的属性为nil，另一边的属性不能为nil的情况；
//还有第三种情景：初始化之前两边属性都为nil，初始化完成后，两边的属性拥有值；这时候就可以一边使用unowne d属性，另一边使用隐式解包属性。
class Country {
    let name: String
    var capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//MARK: - Strong Reference Cycles for Closures
//闭包也会发生循环引用的原因是当赋值闭包赋值的时候，也是强引用的形式；闭包体中如果访问了self的属性或者self的方法，则会对self形成强引用。这样就形成了循环引用；
//swift通过闭包持有列表来解决这个问题（closure capture list）
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
var heading: HTMLElement! = HTMLElement(name: "h1")
let defaultText = "Some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())
heading = nil

//需要注意的是，lazy属性里面是可以访问self的，因为lazy属性总是在类实例初始化完成之后再访问。
//上面的代码是没有问题的，因为闭包不强引用self。请看下面的情况：

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML());
paragraph = nil;

//上面就形成了强引用环。在闭包中访问self的属性，则闭包对self会进行强引用。self对闭包又是强引用，故形成了强引用环。

//MARK: - Resolving Strong Reference Cycles for Closures
//通过定义持有列表来解决闭包的循环引用问题。
//需要注意，swift要求我们在闭包里面访问自身的属性的时候，必须使用self.来访问，不能直接访问。这可以让我们记得注意闭包的循环引用问题。


//MARK: - Defining a Capture List
//持有列表里面的每个元素都是weak或者unowned关键字跟着要引用的类实例或者变量表达式（例如：delegate=self.delegate!）

/*
lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    //closure body goes here
}
 
lazy var someClosure: () -> String = {
    [unowned self, weak delegate = self.delegate!] in
    //closure body goes here
}*/

class TestClass {
    weak var myDelegate: NSObject?
    lazy var myClosure: (Int, String) -> String = {
        [unowned self, weak delegate = self.myDelegate!](index: Int, stringToProcess: String) -> String in
        return "This is a test, \(index) + \(stringToProcess)"
    }
}

//MARK: - Weak and Unowned References
//在闭包中定义unowned引用持有列表，则闭包和闭包持有引用的实例变量会一直持有彼此，将会在相同的时间销毁。
//相反，当闭包持有的引用对象某一个时刻可能会变为nil的时候，使用weak引用持有列表。weak引用必须是可选类型，当引用的实例释放的时候，weak引用会被自动置为nil。
//如果持有永远不会变为nil的话，应当使用unowned引用而不是使用weak引用
class HTMLElementResolve {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
var paragraphResolve: HTMLElementResolve? = HTMLElementResolve(name: "p", text: "hello, world")
print(paragraphResolve!.asHTML())
paragraphResolve = nil

