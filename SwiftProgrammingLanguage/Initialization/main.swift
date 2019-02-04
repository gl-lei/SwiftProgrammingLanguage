//
//  main.swift
//  Initialization
//
//  Created by gl on 2017/1/19.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Initialization(4.2)

import Foundation

//MARK: - Setting Initial Values for Stored Properties
//类或者结构体的实例在创建的时候，存储属性都必须要有初始值。可以在初始化方法里面为存储属性赋值，或者为存储属性提供默认值。需要注意的是，两种方式都是直接为实例变量赋值，而不是调用属性来赋值。

//MARK: - Initializers
struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit.")

//MARK: - Default Property Values
//当我们不提供任何初始化方法的时候，系统会自动提供默认初始化方法
struct Fahrenheit1 {
    var temperature = 32.0
}

//MARK: - Customizing Initialization
struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

//MARK: - Parameter Names and Argument Labels
//函数和方法都可以提供内部使用的参数名和外部看到的参数名标签，然而初始化方法没有像普通方法或者函数那样拥有一个具体的名字(初始化方法名只能是init)，所以初始化方法的参数和参数标签非常重要。如果我们在定义初始化方法的时候不提供参数标签，则系统会自动提供，参数标签与参数名一样。
struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let color = Color(red: 0.9, green: 0.9, blue: 0.9)
let color1 = Color(white: 0.4)
print(color.red)

//MARK: - Initializer Parameters Without Argument Labels
//如果我们不想为初始化方法的参数提供参数标签，则使用_来代替
struct Celsius1 {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius1(37.0)

//MARK: - Optional Property Types
//可选类型的存储属性默认值为nil，可以不在初始化方法中赋值。
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

//MARK: - Assigning Constant Properties During Initialization
//在初始化方法中给常量赋值，对于类来说，只能在初始化方法中修改自己的常量属性，不能修改父类的。
class SurveyQuestion1 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}
let bettsQuestion = SurveyQuestion1(text: "How about beets?")
bettsQuestion.ask()

//MARK: - Default Initializers
//如果我们自定义的类和结构体都没有提供任何的初始化方法，那么Swift将提供默认的初始化方法。默认的初始化方法会把所有的属性赋值默认值
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

//MARK: - Memberwise Initializers for Structure Types
//如果自定义的结构体没有提供我们自定义的初始化方法，那么结构体除了提供默认的初始化方法之外，还会提供一个成员初始化方法(memberwise initializer)。
struct Size {
    var width = 0.0, height = 0.0
}
let defaultS = Size()
let twoByTwo = Size(width: 2.0, height: 2.0)

//MARK: - Initializer Delegation for Value Types
//初始化方法可以调用其他初始化方法来执行实例变量的初始化。这被称为初始化方法代理。
//值类型(结构体和枚举类型)的初始化代理与类的初始化代理的规则不同，因为值类型不能继承。
//值类型使用self.init来引用其他初始化方法，需要注意只能在初始化方法中调用。另外，如果我们提供了自定义初始化方法，则系统不再提供默认初始化方法和成员初始化方法(如果是结构体的话)，如果我们同时想要系统提供的默认初始化方法和成员初始化方法，又要我们自己提供的初始化方法，则我们可以在类型的extenson中提供我们自定义的初始化方法。
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {
        
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y:originY), size:size)
    }
}
let basicRect = Rect()
print(basicRect)

//MARK: - Class Inheritance and Initialization
//swift为类类型提供了两种类型的初始化方法：指定初始化方法和便利初始化方法。
//所有的存储属性，包括继承自父类的，在初始化方法中都必须要赋值。

//MARK: - Designated Initializers and Convenience Initializers
//指定初始化方法属于类自己所有，指定初始化方法会初始化类自身的所有的存储属性，然后调用父类的合适的初始化方法来初始化继承自父类的存储属性。每个类至少都会有一个指定初始化方法。

/*
init(参数列表) {
    语句
}*/

//便利初始化方法可以调用指定初始化方法来为成员变量赋值。我们也可以不提供便利初始化方法。
/*
convenience init(参数列表) {
    语句
}*/

//MARK: - Initializer Delegation for Class Types
//规则1：指定初始化方法必须调用直接父类的指定初始化方法
//规则2：便利初始化方法必须调用类中的其他初始化方法
//规则3：便利初始化方法归根结底还是必须调用指定初始化方法

//MARK: - Two-Phase Initialization
//类的初始化两部曲：1.第一阶段，类中自身的存储属性都被设置为初始值。2.第二阶段，可以选择修改存储属性的初始值。
//其实这个规则与OC中的规则很相似，OC里面会为每个属性设置为0或者为nil，只不过swift中的有些属性不能直接设置为0或者nil。

//编译器会执行一些安全检查来确保初始化两步骤的正确执行：
//安全检查1：在调用父类的指定初始化方法之前，确保类中自身的存储属性全部得到初始化
//安全检查2：必须在调用父类的指定初始化方法后，才可以给继承自父类的属性赋值。否则赋值将会被父类的指定初始化方法覆盖。
//安全检查3：便利初始化方法必须调用其他指定初始化方法，之后才可以给属性赋值。否则便利初始化方法给属性的赋值将会被代理初始化方法覆盖。
//安全检查4：在初始化方法中，不能调用任何的实例方法，不能读取任何实例属性的值，不能在类的初始化第一阶段完成前使用self作为值。

//类的初始化两部曲执行的具体过程：
//第一阶段：
//1.类的代理初始化方法或者便利初始化方法被调用
//2.分配类实例的内存
//3.初始化所有的存储属性
//4.调用直接父类的指定初始化方法
//5.直接父类再调用父类的指定初始化方法，一直到继承的顶端
//6.到达继承的顶端之后，继承链全部完成，所有的存储属性都被初始化完成，第一阶段完成。

//第二阶段
//1.在继承链中的指定初始化方法可以给属性来赋值，可以通过self来修改属性，调用实例方法等等。
//2.最后，任何的便利初始化方法都可以来给属性赋值，使用self来执行某些操作。

//MARK: - Initializer Inheritance and Overriding
//不同于Objective-C语言，Swift语言默认是不继承父类的初始化方法的。在一些特定的情况下可以继承。

//如果我们想提供一个或者多个与父类相同的初始化方法，我们可以在子类中定义这些初始化方法。
//当在子类中定义的初始化方法与父类中指定初始化方法一样的时候，我们需要在指定初始化方法前面写上override。即使是重写默认的初始化方法也要加上override。
//子类将父类的指定初始化方法重写为便利初始化方法也必须要加上override
//如果我们重写父类中的便利初始化方法时，不需要写override了。
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

//如果子类初始化方法在初始化程序的第二步中没有任何需要自定义数值的话，并且父类拥有不带有参数的指定初始化方法，
//我们可以在子类的所有存储属性赋值完之后，删掉super.init()的调用

//MARK: - Automatic Initializer Inheritance
//子类默认是不继承父类的初始化方法的，然而在满足一定情况的条件下，子类也是可以继承父类的初始化方法的。

//如果我们对子类中定义的所有属性都提供了默认值，则以下规则可以使用：
//规则1：如果子类没有定义任何指定初始化方法，则子类自动继承父类的所有的指定初始化方法。
//规则2：如果子类提供了父类所有的指定初始化方法的实现，无论是通过规则1还是通过重写指定初始化方法，都会自动继承父类所有的便利初始化方法。
//即使子类添加了更多的便利初始化方法上述规则也适用。

//注意，子类可以将父类的指定初始化方法实现为便利初始化方法，以此满足达到规则2。

//MARK: - Designated and Convenience Initializers in Action
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEgg = RecipeIngredient(name: "Eggs", quantity: 6)

//继承自父类所有的初始化方法
class ShoppingListItem1: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "√" : "×"
        return output
    }
}

var breakfastList = [
    ShoppingListItem1(),
    ShoppingListItem1(name: "Bacon"),
    ShoppingListItem1(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘

//MARK: - Failable Initializers
//可失败的初始化方法，通过'reutrn nil'来表示初始化方法失败
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

//MARK: - Failable Initializers for Enumerations
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

//MARK: - Failable Initializers for Enumerations with Raw Values
//在没有定义任何初始化方法前，带有原值的枚举会自动产生一个可失败的初始化方法：init?(rawValue:)。
enum TemperatureTest: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let temp = TemperatureTest(rawValue: "K")
if let t = temp {
    print("case is \(t).")
}

//MARK: - Propagation of Initialization Failure
//类、结构体、枚举的可失败的初始化方法可以在类、结构、枚举内部调用另外的可失败初始化方法。相同的，子类的可失败初始化方法也可以调用父类的可失败初始化方法。需要注意的是，一旦在调用过程中初始化方法失败了，则初始化结束，不会申请任何内存空间。
//可失败初始化方法也可以调用正常的初始化方法。
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}
let cart = CartItem(name: "", quantity: 1)
if cart == nil {
    print("unable to initialize one unnamed product.")
}

//MARK: - Overriding a Failable Initializer
//我们可以在子类中重写父类的可失败初始化方法，可以重写成可失败的，也可以重写成不可失败的。需要注意的是，如果我们重写你成不可失败的初始化方法，就只能通过强制解包父类可失败初始化方法的方式来调用。
//注意，我们在重写可失败的初始化方法的时候，还可以通过不调用父类的可失败初始化方法，调用其他正常的初始化方法(如果可以的话)。
class Document {
    var name: String?
    init() {
        
    }
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

//MARK: - The init! Failable Initializer
//我们也可以定义隐式解包的可失败初始化方法，init?和init!可以相互调用，也可以用init?来重写init!，也可以使用init来调用init!

//MARK: - Required Initializers
//我们将required关键字放在类初始化方法的前面来表明此类的子类都必须实现这个初始化方法。
class SomeClass {
    required init() {
        
    }
}

class SomeSubclass: SomeClass {
    required init() {
        //实现代码
    }
}

//MARK: - Setting a Default Property Value with a Closure or Function
//如果存储属性的默认值需要一些定制，你可以使用闭包或者全局函数来提供默认值。当类的初始化方法调用的时候，为属性指定的闭包或者全局函数就会被调用，返回值就作为属性的默认值。
//需要注意的是，如果我们采用闭包的形式，类实例这时候还没有初始化完成，在闭包里面无法访问类中的其他属性，方法。
class SomeClass1 {
    var myVar: Int = {
        let a = 4
        let b = 10
        print("调用了myVar属性的定制闭包")
        return a + b
    }()
    
    init() {
        print("调用了SomeClass1类的初始化方法")
        myVar = 22
    }
}
var sClass = SomeClass1()
print("最终myVar的结果：\(sClass.myVar)")

