//
//  main.swift
//  The Basics
//
//  Created by gl on 16/7/6.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - The Basics(4.2)

import Foundation

//对于所有的基础C类型和OC类型，Swift提供了与之对应的自有版本类型，Int为整型，Double、Float为浮点类型，Bool为布尔类型，String为文本类型。Swift还提供了容器类：Array、Set、Dictionary
//Swift提供了高级类型，元组、可选类型等
//Swift是一门类型安全的语言

//MARK: - Constants and Variables
//常量即值不可改变的量，变量是值可以随时发生变化的量

//MARK: - Declaring Constants and Variables
let maximunNumberOfLoginAttempts = 10   //常量
var currentLoginAttemp = 0              //变量

var x = 0.0, y = 0.0, z = 0.0            //一行定义多个变量

//MARK: - Type Annotations
var welcomeMessage: String              //类型声明
welcomeMessage = "Hello"

var red, green, blue: Double

//实际写代码中我们很少使用类型声明，在定义变量的时候初始化一个值，swift则会根据这个值来推断出变量的类型

//MARK: - Naming Constants and Variables
//常量或变量的名字几乎可以包括任何字符，包括Unicode字符
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

//常量或变量的名称中不能包含空格字符、数学符号、箭头、私人使用(或者非法)的Unicode字符集、破折号(-)、box-drawing字符。也不能以数字开头，但数字可以包含在名称的其他位置。
//可以使用``来包裹swift中使用的关键字，这样就可以作为变量的名字，不过不推荐这么用。
let `let` = 34
print(`let`)

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++"          //编译错误，常量不可改变

//MARK: - Printing Constants and Variables
//使用print(_:separator:terminator:)函数进行打印，separator(分隔符)和terminator(终止符)参数有默认值，我们可以不用指定。默认情况下输出值后会自动换行，我们可以这样写不输出换行
print("Welcome \(languageName)", terminator: "")
print("The current value of friendlyWelcome is\(friendlyWelcome)")

//MARK: - Comments
//使用//进行单行注释，/**/进行多行注释，和C语言不同，多行注释是可以嵌套的

//MARK: - Semicolons
//Swift中不要求你在每条语句的后面使用分号，如果在一行有多条语句的话，需要使用分号隔开
let cat = "🐱";print(cat)

//MARK: - Integers
//Swift提供了8、16、32、64位有符号和无符号的整数，和Swift中的其他类型一样，这些类型首字母大写。(UInt8、Int32等)

//MARK: - Integer Bounds
//我们可以通过min和max属性来访问每个整型的最大值和最小值
let minValue = UInt8.min
let maxValue = UInt8.max
print("UInt8's minValue: \(minValue), maxValue: \(maxValue)")

//MARK: - Int
//大多数情况下，你都不需要使用特定大小的整型，Swift提供了Int类型，Int类型的大小与当前平台的原生字(native word)大小相同
//32位平台，Int类型相当于Int32；64位平台，Int类型相当于Int64

//MARK: - UInt
//Swift同样提供了无符号的整型：UInt，类似于Int类型，UInt类型大小与当前平台字相关
//32位平台，UInt相当于UInt32；64位平台，UInt相当于UInt64

//MARK: - Floating-Point Numbers
//Swift提供了两种类型的浮点数据类型：Double(64位)和Float(32位)，Double类型精确度至少为15个数字，Float只有6个有效数字

//MARK: - Type Safety and Type Inference
//Swift是一门类型安全的语言, 在编译代码的时候会进行类型校验。
//Swift会自动推断变量或者常量的类型
let meaningOfLife = 42          //Int类型
let pi = 3.14159                //Double类型
let anotherPi = 3 + 0.14159     //Double类型

//MARK: - Numeric Literals
//十进制数字不带有前缀；二进制数字带有0b前缀；八进制数字带有0o前缀；十六进制数字带有0x前缀；
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

//浮点数可以使用十进制或者十六进制表示，小数点前后必须存在数字。浮点数的十进制表示形式可以使用指数(e或E，表示10的几次幂)来表示。浮点数的十六进制形式必须使用指数(p或者P，表示2的几次幂)形式来进行表示。
let exponentF = 1.25e2      //1.25x10^2即125.0
let exponentF1 = 1.25e-2    //1.25x10^-2即0.0125
let exponentF2 = 0xFp2      //15x2^2即60.0
let exponentF3 = 0xFp-2     //15x2^-2即3.75

//数字字面值可以包含其他的格式来使数据更加易读。整数和浮点数都可以使用数字0或者下划线来使数据更加易读。
let paddedDouble = 000123.456
let oneMillion = 1_000_000

//MARK: - Numeric Type Conversion
//常量或者变量推断类型使用Int，只有在其他需要特定类型的时候指定为其他的整数类型。

//MARK: - Integer Conversion
//不同的数值类型存储的数据范围不同。Int8类型存储数据范围为-128~127，UInt8存储范围为0~255，注意数据类型不能溢出。
//let cannotBeNegative: UInt8 = -1      //不能为负数
//let tooBig: Int8 = Int8.max + 1       //数据溢出

//因为不同的类型不能在一起进行运算，我们可以使用SomeType(value)来进行数值类型的转换。
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)   //注意UInt16(value)是调用UInt16的初始化函数来构造UInt16变量，value并不是任何类型都可以，必须是UInt16定义了此类型的初始化函数才可以。

//MARK: - Integer and Floating-Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pii = Double(3) + pointOneFourOneFiveNine

//浮点类型转换为整型，转换的时候总是截去小数部分而不会进位。
let integerPi = Int(pi)

//字面值本身没有隐式类型，所以3+0.123是可以在一起运算的。只有在赋值的时候，才会进行类型推断，此时字面值才会产生相应类型。
let r = 0.12345
let w = r + 3
print(w)

//MARK: - Type Aliases
//使用typealias关键字来为存在的类型指定一个别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//MARK: - Booleans
//swift提供基本的Boolean类型: Bool。值为true和false。
let orangesAreOrange = true
let turnipsAreDelicious = false

//当我们使用条件表达式的时候，Bool类型特别有用
if turnipsAreDelicious {
    print("Mmm, tasty turnips!");
} else {
    print("Eww, turnips are horrible.")
}

//条件表达式不支持隐式转换
let i = 1
//if i {                        //这是不正确的，不能隐式转换
//    print("hello")
//}

if i == 1 {
    print("Hello")
}

//MARK: - Tuples
//Tuples元组表示将多个值写到单个复合值里面。
let http404Error = (404, "Not Found")       //类型为(Int, String)

//可以为元组里面的元素指定名字，然后采用名称来使用元组里面的元素
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode).")
print("The status message is \(statusMessage).")

//如果想要忽略元组中的某些元素，使用_来表明即可。
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode).")

//还可以使用index来访问元组中的元素
print("The status code is \(http404Error.0).")
print("The status message is \(http404Error.1).")

//在元组定义的时候，可以为每个元素指定名称
let http200Status = (statusCode:200, description: "OK")

//如果使用名称为元素命名了，则可以使用名称来访问相应的元素
print("The status code is \(http200Status.statusCode).")
print("The status message is \(http200Status.description).")

//元组作为函数的返回值特别有用处，对于临时的相关变量组非常有用。

//MARK: - Optional
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)       //convertedNumber类型为optional类型

//MARK: - nil
//我们可以给optional变量赋值nil，nil只能用于optional变量
var serverResponseCode: Int? = 404
serverResponseCode = nil

//如果我们定义optional变量的时候没有提供默认值，则变量会自动赋值为nil。
var surveyAnswer: String?

//Swift中的nil与OC中的nil不同，OC中的nil表示的是空指针而Swift中的nil表示的是optional变量没有值的状态，Swift中的nil可以用在任何类型的optional变量上面，而不仅仅是对象类型。

//MARK: - If Statements and Forced Unwrapping
//我们可以使用if条件表达式来判断optional变量是否包含一个值或者不包含任何值。
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//一旦确定optional变量包含一个值，我们可以用!放在optional变量的尾部去访问变量的值。这叫做强制解包。
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//使用!来访问不存在值的optional变量会导致运行时错误。使用!操作前，一定要确保optional变量包含一个值。

//MARK: - Optional Binding
//使用Optional Binding来检测Optional是否包含一个值，如果包含值则将值赋值给临时常量。Optional Binding可以用在if或者while表达式中
//用法：if let constantName = someOptional { statements}
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber).")
} else {
    print("\'\(possibleNumber)\' could not converted to an integer.")
}

//我们可以在一条if语句里面包含多个optional binding并且还可以使用where条件来检测表达式。
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber).")
}

//MARK: - Implicitly Unwrapped Optionals
//在定义变量的时候，将!防置到变量的后面，则表明这个变量为隐式解包optional变量，在使用的时候我们就不需要进行解包操作了，系统会自动解包。一定要确保变量存在一个值，否则在进行自动解包的时候会出错。
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!          //强制解包

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString          //自动解包

//我们仍然可以将隐式解包optional变量看做一个正常的optional变量来检测它是否包含有值
if assumedString != nil{
    print(assumedString)
}

//同样我们可以使用optional binding来进行解包操作
if let definiteString = assumedString {
    print(definiteString)
}

//如果optional变量会有赋值为nil的可能性，则不要使用隐式解包optional变量而是使用普通的optional变量

//MARK: - Error Handling
func canThrowAnError() throws {
    //函数可以抛出或者不抛出异常
}

//通过在函数后面加throws关键字来标识函数可能会抛出异常，当我们调用此类函数的时候，需要注意使用try关键字来捕获异常。
//Swift会不断的向上一级作用域抛出异常，直到被catch语句进行处理。
do {
    try canThrowAnError()
} catch {
    //异常被抛出到这里
}

//do表达式创建了一个新的容器域(containing scope)，在此容器域里面允许错误被传送到一个或者多个catch语句中。
enum MyError: Error {
    case outOfCleanDishes
    case missingIngredients(ingredients: Int)
}

//func makeASandwich() throws {
//    throw myError.missingIngredients(ingredients: 5)
//}

func eatASandwich() {
    print("Eat Sandwich.")
}

func washDishes() {
    print("wash dishes.")
}

func buyGroceries(_ ingredients: Int) {
    print("buy \(ingredients) ingredients.")
}

//do {
//    try makeASandwich()
//    eatASandwich()
//} catch Error.outOfCleanDishes {
//    washDishes()
//} catch Error.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}

//MARK: - Assertions And Preconditions
//断言和前置条件是在运行时发生的检查。在执行任务进一步的代码之前，您可以使用它们来确保满足基本条件。如果断言或前置条件中的布尔条件求值为true，则代码将照常执行。如果条件的计算结果为false，则程序的当前状态无效，代码执行结束，应用程序终止运行。
//断言和前置条件之间的区别在于它们的检查时间：仅在调试版本中检查断言，但在调试和生成版本中都会检查前置条件。在生产版本中，不会检查断言中的条件。这意味着您可以在开发过程中使用任意数量的断言，而不会影响生产中的性能。
//一些情况下代码中某些特定条件没有满足的时候，代码将会暂停执行。你可以使用assertion来终止代码的运行，以此来调试某些bug。

//MARK: - Debugging with Assertions
//assertions中指定的条件表达式为true的时候代码才会继续执行，使用assert(_:_file:line:)函数
let age = 0
//assert(age >= 0, "A person's age cannot be less than zero")
//assert中的message可以省略掉
//assert(age >= 0)

//如果代码早已检测了异常情况，可以直接使用assertionFailure(_:file:line:)函数
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

//MARK: - Enforcing Preconditions
//只要条件可能为false，就使用前置条件，但对于代码继续执行必须确实为真。例如，使用前置条件检查下标是否超出范围，或检查函数是否已传递有效值。
//使用precondition(_:_:file:line:)函数来执行前置条件
var index = 3
precondition(index > 0, "Index must be greater than zero")

//在确保条件检测不通过的时候，也可以直接调用preconditionFailure(_:file:line:)函数来表示错误的发生。
//需要注意：
//如果以未选中模式编译（-Ounchecked），则不检查前置条件，编译器会假定前置条件始终为true，并相应地优化代码。但是，无论优化设置如何，fatalError（_：file：line :)函数始终会暂停执行。

//您可以在原型设计和早期开发期间使用fatalError（_：file：line :)函数，通过编写fatalError（“Unimplemented”）来创建尚未实现的功能的存根。因为fatalError错误永远不会被优化。
//与断言或前置条件不同，您可以确保执行总是在遇到存根实现时停止。

