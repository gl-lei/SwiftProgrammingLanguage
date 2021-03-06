# Swift Programming Language
The Swift Programming Language's Translation For Chinese(5.0 version)

Swift 编程语言翻译（5.0版本）

这是自己在学习的时候做的官方的一些翻译笔记，以及每章知识内容总结，希望能帮助到大家。
### 一、目录列表
|序号| 章节|官方文档地址|
|----------|-----------|----------|
|0            | [Swift体验](./SwiftProgrammingLanguage/0.SwiftTour/main.swift) | [Swift体验](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html) |
|1            | [基础知识](./SwiftProgrammingLanguage/1.TheBasics/main.swift) | [基础知识](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#) |
|2            | [基础运算符](./SwiftProgrammingLanguage/2.BasicOperators/main.swift) | [基础运算符](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html) |
|3            | [字符串与字符](./SwiftProgrammingLanguage/3.StringAndCharacters/main.swift) | [字符串与字符](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html) |
|4            | [容器类型](./SwiftProgrammingLanguage/4.CollectionTypes/main.swift) | [容器类型](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html) |
|5            | [流程控制](./SwiftProgrammingLanguage/5.ControlFlow/main.swift) | [流程控制](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html) |
|6            | [函数](./SwiftProgrammingLanguage/6.Functions/main.swift) | [函数](https://docs.swift.org/swift-book/LanguageGuide/Functions.html) |
|7            | [闭包](./SwiftProgrammingLanguage/7.Closures/main.swift) | [闭包](https://docs.swift.org/swift-book/LanguageGuide/Closures.html) |
|8            | [枚举](./SwiftProgrammingLanguage/8.Enumeations/main.swift) | [枚举](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html) |
|9            | [结构体与类](./SwiftProgrammingLanguage/9.ClassesAndStructures/main.swift) | [结构体与类](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html) |
|10            | [属性](./SwiftProgrammingLanguage/10.Properties/main.swift) | [属性](https://docs.swift.org/swift-book/LanguageGuide/Properties.html) |
|11            | [方法](./SwiftProgrammingLanguage/11.Methods/main.swift) | [方法](https://docs.swift.org/swift-book/LanguageGuide/Methods.html) |
|12            | [下标](./SwiftProgrammingLanguage/12.Subscripts/main.swift) | [下标](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html) |
|13            | [继承](./SwiftProgrammingLanguage/13.Inheritance/main.swift) | [继承](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html) |
|14            | [初始化方法](./SwiftProgrammingLanguage/14.Initialization/main.swift) | [初始化方法](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html) |
|15            | [析构方法](./SwiftProgrammingLanguage/15.Deinitialization/main.swift) | [析构方法](https://docs.swift.org/swift-book/LanguageGuide/Deinitialization.html) |
|16            | [可选类型调用链](./SwiftProgrammingLanguage/16.OptionalChaining/main.swift) | [可选类型调用链](https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html) |
|17            | [错误处理](./SwiftProgrammingLanguage/17.ErrorHandling/main.swift) | [错误处理](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html) |
|18            | [类型转换](./SwiftProgrammingLanguage/18.TypeCasting/main.swift) | [类型转换](https://docs.swift.org/swift-book/LanguageGuide/TypeCasting.html) |
|19            | [嵌套类型](./SwiftProgrammingLanguage/19.NestedTypes/main.swift) | [嵌套类型](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html) |
|20            | [扩展](./SwiftProgrammingLanguage/20.Extensions/main.swift) | [扩展](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html) |
|21            | [协议](./SwiftProgrammingLanguage/21.Protocols/main.swift) | [协议](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html) |
|22            | [泛型](./SwiftProgrammingLanguage/22.Generics/main.swift) | [泛型](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) |
|23            | [不透明类型](./SwiftProgrammingLanguage/23.OpaqueTypes/main.swift) | [不透明类型](https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html) |
|24            | [自动引用计数](./SwiftProgrammingLanguage/24.AutomaticReferenceCounting/main.swift) | [自动引用计数](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html) |
|25            | [内存安全](./SwiftProgrammingLanguage/25.MemorySafety/main.swift) | [内存安全](https://docs.swift.org/swift-book/LanguageGuide/MemorySafety.html) |
|26            | [访问控制](./SwiftProgrammingLanguage/26.AccessControl/main.swift) | [访问控制](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html) |
|27            | [高级运算](./SwiftProgrammingLanguage/27.AdvancedOperations/main.swift) | [高级运算](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html) | 


### 二、知识大纲总结
#### 第一章：基础知识
1. 基本类型(`Int`、`Double`、`Float`、`Bool`、`String`、`Array`、`Set`、`Dictionary`)
2. 常量和变量(`let`、`var`)
3. 类型推断以及类型声明
4. 变量名字规则
5. 打印函数的使用(`print(_:separator:terminator:)`)
6. swift 中注释的使用(单行：`//` 多行：`/**/`)
7. 整型变量的边界值(`UInt8.min`、`UInt8.max`)
8. 文字常量(十进制不带有前缀；二进制数字带有 `0b` 前缀；八进制数字带有 `0o` 前缀；十六进数字制带有 `0x` 前缀)
9. swift 中类型转换(`Double(3)`、`Int(pi)`)
10. 给现有类型起别名(`typealias`)
11. 条件表达式不支持隐式转换(赋值表达式没有返回值)
12. 元组的定义以及使用
13. 可选类型的定义以及使用
14. `nil`在 Objective-C 和 swift 中的区别
15. `Optional Binding` 机制(`if let ...`)
16. 可选类型的隐式解包以及强制解包
17. 错误处理(`try` `catch`)
18. 断言(`assert`)和前置条件(`precondition`)(Debug 模式，Release 模式，`-Ounchecked`)
19. 前置条件的使用(Enforce Preconditions)
20. `fatalError(_:file:line:)` 可以用来表示未完成的任务功能标记

#### 第二章：基础运算符
1. 赋值运算符(赋值表达式没有返回值)
2. `+`、`-`、`*`、`/`、`%`(与第一个运算数的正负保持一致(取余运算))
3. `===` 和 `!==`
4. 元组的比较(类型相同，个数相同，少于7个元素；多余7个元素需要自己实现比较方法)
5. 空值解包合并运算(a `??` b)
6. 范围运算符(闭范围运算符、半开范围运算符、单边范围运算符)(`...`，`..<`，`array[2...]`，`array[...2]`，`array[..<2]`)
7. 逻辑运算符(`!`、`&&`、`||`)

#### 第三章：字符串与字符
1. 字符串字面值常量以及多行字符串字面值常量
2. 空字符串的初始化(`""` 或者 `String()`)
3. 可变字符串
4. 字符串是**值类型**
5. 字符串的连接(`+`、`+=`)
5. 字符串与字符类型的连接(`append()`)
6. 字符串的个数(`count`)
7. 访问和修改字符串(`String.Index`、`startIndex`、`endIndex`、`index(before:)`、`index(after:)`、`index(_:offsetBy:)`)
8. 字符串的插入和删除(`insert(_:at:)`、`insert(contentsOf:at:)`、`remove(at:)`、`removeSubrange(_:)`)(`RangeReplaceableCollection`协议)
9. 子串类型以及操作(`Substring`)
10. 字符串的比较(`==`、`!=`、`hasPrefix(_:)`、`hasSuffix(_:)`)
11. 字符串的 Unicode 表示形式(`utf8`、`utf16`、`unicodeScalars`)
12. Unicode 和 UTF8、UTF16 的区别(Unicode 是编码标准，UTF8 和 UTF16 是具体的 Unicode 编码标准实现)

#### 第四章：容器类型
1. swift 中的集合类型(Array、Set、Dictionary)
2. 数组的创建(`Array<T>` 或者 `[T]`)(`[Int]()`、`[Double](repeating: 0.0, count: 3)`)
3. 数组的合并(`+`)
4. 数组的访问和修改(`count`、`isEmpty`、`append(_:)`、`+=`、`[0]`、`[4...6]`、`insert(_:at:)`、`remove(at:)`、`removeLast()`)
5. 数组的遍历(`for in`、`enumerated()`)
6. 集合类型(hashable)
7. 集合的创建(`Set<T>()`)
8. 集合元素的访问和修改(`count`、`isEmpty`、`insert(_:)`、`remove(_:)`、`removeAll()`、`contains(_:)`)
9. 集合的遍历(`for in`、`sorted()`)
10. 集合的操作方法(`intersection(_:)`、`symmectricDifference(_:)`、`union(_:)`、`subtracting(_:)`)
11. 集合的子集以及相等判断(`isSubsetOf(_:)`、`isSuperSetOf(_:)`、`isStrictSubsetof(_:)`、`isStrictSupersetOf(_:)`、`isDisjoinWith(_:)`)
12. 字典的初始化(`Dictionary<Key, Value>()`、`[Key: Value]()`)
13. 字典的访问以及修改(`count`、`isEmpty`、下标操作、value 赋值为 `nil` 来移除元素、`updateValue(_:forKey:)`、`removeValue(forKey:)`)
14. 字典的遍历(`for in`、`keys`、`values`)

#### 第五章：流程控制
1. `for in` 循环
2. 间断跳跃循环：`stride(from:to:by:)`、`stride(from:through:by:)`
3. `while`、`repeat-while` 循环
4. if、switch 条件语句(没有隐式的 fallthrough、不需要写 break、间隔匹配、元组匹配、值绑定、where 条件、复合 case)
5. continue、break、fallthrough、return、throw
6. labeled statements
7. guard 语句
8. 检测 API 的可用性(`if #available(iOS 9, macOS 10.10, *) {}`)

#### 第六章：函数
1. 函数的定义
2. 函数的书写形式(不带参数、带有多个参数、不带返回值、带有多个返回值(元组、Optional))
3. 函数的参数标签和参数名称
4. 函数参数的默认值
5. 函数的可变参数(最多只有一个)
6. 函数的 `inout` 传参(`inout` 参数不能拥有默认值，可变参数不能被标识为 `inout`)
7. 函数类型(作为变量、作为参数、作为返回值)
8. 嵌套函数

#### 第七章：闭包
1. 闭包的定义
2. 数组 `sorted(by:)` 方法解析
3. `sorted(by:)` 方法闭包的书写形式(省略参数类型和返回值类型；单语句闭包省略return关键字(单语句闭包隐式返回表达式的值)；省略参数类型、参数名称以及返回值类型，使用 $0、$1...；使用操作符(>、<))
4. 尾闭包的定义(Trailing Closures)
5. 尾闭包的书写形式(不写参数标签，闭包写在函数小括号后面)
6. 尾闭包的简写形式(闭包作为唯一参数，可以省略函数的一对小括号)
7. 闭包持有变量或者常量(闭包可以持有作用域内的常量和变量，并且可以修改这些变量的值，即使这些变量定义的作用域不存在了)
8. 闭包类型是引用类型(不是值类型)(注意循环引用的问题)
9. 逃离闭包的定义(Escaping Closures)(@escaping)
10. 在逃离闭包中需要显式使用 `self`，非逃离闭包可以不用
11. 自动闭包(Autoclosures)的定义(@autoclosure)(不要过多的使用)

#### 第八章：枚举
1. 枚举的定义(与其他语言的区别：没有默认值)
2. 枚举 `Case` 的匹配(每个 `case` 后不需要加 `break`)
3. 枚举 `Case` 的遍历(`CaseIterable`协议、`allCases`属性)
4. 枚举关联值的定义
5. 枚举关联值的使用(关联值携带数据、匹配用 `let` 获取关联值)
6. 枚举原值的定义(Raw Values)
7. 枚举原值的隐式赋值(`Int` 枚举原值第一个值为0，后面的值递增；字符串类型原值默认为其 `case` 名称)
8. 枚举原值的初始化方法(`init?(rawValue:)`)
9. 枚举递归(枚举 `Case` 中的关联值类型为自身枚举类型、`indirect`)

#### 第九章：结构体与类
1. 结构体与类的共同点(存储值、函数能力、初始化方法、扩展、协议)
2. 类比结构体具有的额外能力(继承、运行时类型转换、析构方法、引用计数)
3. 结构体与类的定义语法
4. 结构体和类的属性访问方式(通过 `.`)
5. 结构体的成员初始化方法
6. 结构体与枚举都属于值类型(赋值采用 copy，不使用引用类型)(整型、浮点型、布尔型、字符串、数组、字典都为值类型，底层都采用结构体实现的)
7. 类为引用类型
8. 唯一标识操作运算符(identify Operators)(用来表示是否指向同一个实例对象)(`===`、`!==`)

#### 第十章：属性
1. 存储属性的定义(类、结构体)
2. 计算属性的定义(类、结构体、枚举类型)
3. 常量结构体(无法修改属性值，因为是值类型；常量类可以，因为类是引用类型)
4. 懒存储属性的定义(`lazy` 必须为变量，多线程不保证安全)
5. 计算属性的定义以及使用(`get`、`set`)
6. 只读计算属性也必须标识为 `var`
7. 属性观察者的定义(任何存储属性(除了懒存储属性)；计算属性不需要定义属性观察者;子类对继承来的任何属性都可以定义)
8. `willSet` 和 `didSet` (`newValue` 和 `oldValue`)
9. 全局存储属性与全局计算属性(属性观察者、`get` 和 `set`、懒加载)
10. 类型属性的定义(需要初始化、懒初始化、多线程安全)
11. `static` 定义类型属性，类类型如果允许继承则用 `class` 关键字

#### 第十一章：方法
1. 实例方法的定义(方法参数都有名称和参数标签)
2. 实例方法的 `self` 属性(实例方法隐含 `self` 属性)
3. 值类型实例方法修改属性值(`mutating`)(常量实例对象不能调用`mutating` 修饰的方法)
4. 值类型 `mutating` 实例方法修改 `self` 的值
5. 类方法的定义(使用 `static` 或者 `class` 来定义)(类方法中 `self` 代表的是类本身)
6. `@discardableResult` 忽略不使用返回值的警告

#### 第十二章：下标
1. 类、结构体和枚举都可以定义下标操作
2. 下标操作的定义(`subscript`；可读可写；只读可以删除 `get{}`)
3. 下标操作的使用注意事项(可以接收不限个数的参数；参数类型不限制，返回类型也不限制；可以接收可变参数类型；不能使用in-out类型的参数；不能为参数指定默认值；)
4. 下标操作可以进行重载

#### 第十三章：继承
1. 基类的定义
2. 子类的定义
3. 子类可以重写实例方法、类方法、实例属性、类属性或者下标操作(`override`)
4. 通过 `super` 访问父类的实例方法、属性以及下标操作
5. 重写属性(可以为继承来的属性提供 getter 或者 setter，保持属性名称与类型一致；父类只读属性可以重写为可读可写的属性，反之不可以；)
6. 重写父类属性的 setter 则必须要提供重写的 getter
7. 重写属性观察者(常量存储属性与只读计算属性无法添加属性观察者；不能为同一个属性既提供setter还提供属性观察者) 
8. 阻止重写(使用 `final`；方法、属性或者下标操作都可以；`Extension` 中提供的属性、方法、下标也可以；整个类也可以被标识为 `final`)

#### 第十四章：初始化方法(Initialization)
1. 类和结构体在创建实例的时候，存储属性都必须有初始值(初始化方法为存储属性赋值；为存储属性提供默认值；)(两种方式都是直接为实例变量赋值，而不是通过调用属性来赋值)
2. 默认初始化方法(不提供任何自定义初始化方法)
3. 初始化方法的参数名与参数名标签(不提供参数标签会自动将参数名作为参数标签)
4. 不想为初始化方法提供参数标签，使用 `_` 来代替
5. 可选类型的存储属性默认值为 `nil`，可以不在初始化方法中赋值
6. 在初始化方法中为常量存储属性赋值(不能修改父类的)
7. 结构体的成员初始化方法(`memberwise initializer`)(没有提供自定义的初始化方法，除了默认初始化方法之外，还有成员初始化方法)
8. 初始化方法代理(`Initializer Delegation`)
9. 值类型使用 `self.init` 来调用其他初始化方法(只能在初始化方法中调用)
10. 提供了自定义初始化方法则系统不再提供默认初始化方法和成员初始化方法(结构体)(可以在类型的 `Extension` 中提供)
11. 类类型的两种初始化方法：指定初始化方法(`Designated Initializers`)和便利初始化方法(`Convenience initializers`)的定义
12. 指定初始化方法属于类自身所有，指定初始化方法会初始化类自身的所有的存储属性，然后调用父类的合适初始化方法来初始化继承自父类的存储属性。每个类都至少有一个指定初始化方法
13. 便利初始化方法可以调用指定出初始化方法来为成员变量赋值，也可以不提供便利初始化方法
14. 类类型的指定初始化方法规则(规则1：指定初始化方法必须调用直接父类的指定初始化方法；规则2：便利初始化方法必须调用类中的其他初始化方法；规则3：便利初始化方法归根结底还是必须调用指定初始化方法)
15. 类类型初始化两部曲(第一阶段，类中自身的存储属性都被设置为初始值；第二阶段，可以选择修改存储属性的初始值；)
16. 当在子类中定义的初始化方法与父类的初始化方法一样的时候，需要使用 `override` 关键字标识初始化方法，即使是重写默认初始化方法也需要
17. 子类重写父类的指定初始化方法为便利初始化方法也需要加上 `override` 关键字
18. 子类重写父类的便利初始化方法，不需要写 `override` 关键字
19. 子类初始化方法在二部曲的第二步中没有任何需要自定义数值的话，并且父类拥有不带有参数的指定初始化方法，我们可以删除 `super.init()` 的调用
20. 子类默认是不继承父类的初始化方法的，在满足一定条件下，子类也是可以继承父类的初始化方法的
21. 子类中定义的所有属性都提供了默认值，则以下规则适用(规则1：如果子类没有定义任何指定初始化方法，则子类自动继承父类的所有指定初始化方法；规则2：如果子类提供了父类所有的指定初始化方法的实现，无论是通过规则1还是通过重写指定初始化方法，都会自动继承父类所有的便利初始化方法；)(注意，子类可以将父类的指定初始化方法实现为便利初始化方法，以此达到满足规则2)
22. 可失败的初始化方法(通过 `return nil` 来表示初始化方法失败)
23. 可失败初始化方法可以调用其他的可失败初始化方法，也可以调用父类的可失败初始化方法，也可以调用正常的初始化方法
24. 在子类中重写父类的可失败初始化方法(可以重写成可失败的，也可以重写成不可失败的；重写可失败初始化方法可以不调用父类的可失败初始化方法，调用其他正常的初始化方法)
25. 隐式解包可失败初始化方法
26. `Required Initializers`(使用 `required` 关键字)
27. 使用闭包为存储属性提供默认值(在闭包中无法访问类中的其他属性、方法)

#### 第十五章：析构方法(Deinitialization)
1. 析构方法在类实例被销毁之前调用，使用 `deinit` 关键字。析构方法只能应用于类类型
2. swift 采用自动自动引用计数的方式管理内存，我们几乎不需要在 `deinit` 方法里面编写内存释放的代码
3. 子类会继承父类的析构方法，析构方法会自动被调用；父类的析构方法也会被自动调用；

#### 第十六章：可选类型调用链(Optional Chaining)
1. 将 ? 放置在可选类型后面来调用属性、方法或者下标方法
2. 可选类型调用链与可选类型强制解包调用属性、方法的区别
3. 下标可选类型调用链：```john.residence?[0] = Room(name: "ABC")```
4. 方法可选类型调用链：```john.residence?.address?.buildingIdentifier()?.hasPrefix("TEST")```
5. 多重可选调用链的规则

#### 第十七章：错误处理
1. Error 协议(空协议)
2. 通过 `throw` 来抛出错误(定义错误枚举)
3. 错误处理的四种方式(抛、捕获、可选类型、断言)

#### 第十八章：类型转换
1. `is` 和 `as` 操作符
2. 类型向下转换(`as?`、`as!`)
3. `Any` 和 `AnyObject` 的区别

#### 第十九章：嵌套类型
1. 嵌套类型的定义
2. 引用嵌套类型的方式

#### 第二十章：扩展
1. 扩展的作用(1.添加计算属性和计算类型属性 2.定义实例方法和类方法 3.提供新的初始化方法 4.定义下标操作 5.定义和使用新的嵌套类型 6.遵循协议)
2. 扩展实现协议注意事项(1.不能重写方法 2.扩展添加的方法在所有的实例上面都可以使用 3.可以对泛型添加扩展)
3. 扩展可以添加便利初始化方法，不可以添加指定初始化方法
4. 值类型的扩展中可以调用值类型的默认初始化方法和 `memberwise` 方法
5. 实例变量扩展中的方法可以修改或者转变实例变量本身

#### 第二十一章：协议
1. 协议中的属性要求(`var`、`{get set}`、`static`)
2. 协议中的方法要求(可变参数可以，默认值不可以；`static`)
3. 协议中的方法要求，可以实现修改示例(`mutating`)
4. 协议中的初始化方法要求(`required`)
5. 初始化方法要求注意点：如果类用 `final` 修饰，则在实现初始化方法要求的时候不需要添加 `required` ;子类继承父类，又要重写父类中指定的初始化方法，则需要同时使用 `override` 和 `required`
6. 协议中的可失败初始化方法要求
7. 协议作为类型(常量、方法参数、返回值、数组元素)
8. 通过扩展为类添加遵循的新协议
9. 使用 `where` 来对遵循协议的元素做限制(数组遵循协议以及数组的元素遵循协议)
10. 使用空的扩展来遵循协议(类早已满足协议的所有要求)
11. 数组、字典存储遵循特定协议的元素
12. 协议继承语法与类继承语法一致
13. 继承 AnyObject 协议，将协议只对类类型开放
14. 类型遵循了多个协议，使用协议组合表示多个协议(someProtocol `&` AnotherProtocol)
15. 检测协议类型(`is`、`as?`、`as!`)
16. 可选协议的实现(`@objc`、`optional`)
17. 协议通过扩展对遵循协议的实例提供方法或者计算属性的默认实现
18. 协议通过扩展对遵循协议的实例添加特定约束(`where`)
19. 如果遵循协议的实例对协议的多个约束扩展都满足了要求，并且对相同的方法或者属性提供了多个实现，那么swift将以对应最多约束的属性或者方法实现为准

#### 第二十二章：泛型
1. 泛型需要解决的问题(交换两个变量的值)(`swap`)
2. 对泛型进行扩展，不提供参数列表，只能使用泛型定义的类型参数
3. 泛型约束
4. 协议关联类型(`associatedtype`)(`typealias Item = Int` 或者类型推断)
5. 为协议关联类型添加约束条件(遵循特定的协议、`where`)
6. 泛型 `where` 条件约束(泛型函数、扩展、协议关联类型、协议继承)
7. 泛型下标操作

#### 第二十三章：自动引用计数
1. 自动引用计数只适合于类实例，结构体和枚举是值类型，不是引用类型，不是通过指针来引用和存储的
2. 强引用环的产生(Person 与 Apartment)
3. 强引用环的解决(`weak` 与 `unowned`)
4. 声明为 `weak` 引用的属性必须为可选类型，并且必须为变量。`weak` 对象不拥有对象的所有权。当 `ARC` 将 `weak` 引用的属性置为 `nil` 的时候，不会调用属性观察者
5. 与 `weak` 引用一样，`unowned` 引用也是不会强引用所指向的对象。需要注意，只有在确保要引用的对象不会被释放才可以使用 `unowned` 引用，否则引用的对象被释放的话，会触发运行时异常
6. `unowned` 与 隐式解包可选属性(Country 和 City 的例子)
7. 三种情况：Person 与 Apartment；Customer 与 CreditCard；Country 与 City；分别对应三种解决方式：`weak` 适用于两边属性；`unowned` 适用于一边属性为 `nil`，另一边属性不能为 `nil` 的情况；一边使用 `unowned` 属性，另一边使用隐式解包属性；
8. 闭包的强引用环产生的原因：闭包赋值是强引用；在闭包体中访问 `self` 的属性或者 `self` 的方法，则会对 `self` 产生强引用；
9. 通过闭包持有列表来解决闭包强引用的问题

#### 第二十四章：内存安全
1. 内存访问冲突理解(swift 中，有些方式可以持续在几行代码中来一直修改变量的值)(单线程)
2. 内容访问冲突的特性(1.至少有一个访问是写；2.访问内存中的相同位置；3.访问内存的持续时间有重叠(overlap))
3. 内存访问时间要么是瞬时的，要么是持续的(long-term)
4. overlap 的解释：持续访问开始后，在它未结束之前，其他代码都是有可能运行的，这就叫 overlap。持续访问与其他的持续访问或者瞬间访问都是可能重叠的
5. 持续访问主要出现在使用 `in-out` 参数、方法中；结构体的 `mutating` 方法中
6. 持续写访问的后果：1.无法访问作为 `in-out` 参数传递的原变量，这时候对原变量的访问都会产生冲突。2.对函数的多个 `in-out` 参数传递单个变量将会产生冲突
7. 结构体的 `mutating` 方法在方法的调用过程中，对 `self` 有一个持续写访问
8. 值类型属性访问的冲突(结构体、元组、枚举这样的类型都是由不同的值组合而成。因为这些类型都属于值类型，对值类型里面属性值的修改就是对整个值类型的修改，这也就意味着对值类型里面属性的读、写访问也就是对整个值类型的读、写访问)
9. 对局部变量的结构体类型不同属性访问是安全的
10. 为了保证内存安全，对结构体属性的重叠访问的限制并不总是必要的。内存安全是所必要的保证，互斥访问一定能够确保内存安全，但内存安全不一定需要使用互斥访问来实现；也就是说，如果能够保证内存安全，即使违反互斥访问的规则也是可以的；如果编译器能够证明对内存的非互斥访问仍然能够保证内存安全，那么这些代码也是可以使用的。
11. 如果能够满足以下所有条件，则可以证明对结构体属性的重叠访问是安全的：1.访问的是结构体的存储属性，而非计算属性或类属性；2.结构体是局部变量，而不是全局变量；3.结构体要么不被任何闭包持有，要么只被 `nonescaping` 闭包持有；
12. 总结：还是看编译器的提示，如果编译器不能够证明访问是安全的，那么仍然不允许访问

#### 第二十五章：访问控制
1. swift 中的访问控制基于模块与源文件组成
2. 模块是一个单独的代码发布单元-framework 或者应用程序，或者是可以被 swift 以 `import` 关键字导入的程序包(UIKIt、Foundation等)
3. Xcode 中的每个 target (应用程序或者 framework)在 swift 中都被视作一个分离的模块；如果打包成 framework，那么 framework 中的所有代码都属于模块的一部分
4. 源文件指的是模块中的一个单独的 swift 源代码文件
5. swift 提供了五种不同的访问级别- `open`、`public`、`internal`、`fileprivate`、`private`
6. `open` 和 `public` 访问级别：`open` 和 `public` 所修饰的实体可以在实体所在模块的任何 swift 源文件中访问，也可以在导入此模块的其他模块源文件中访问(framework 公共接口，通常使用 `open` 和 `public` 访问级别)
7. `internal` 访问级别：`internal` 访问级别所修饰的实体可以在实体所在模块的任何 swift 源文件中访问，但是不能在其他模块中访问(定义应用程序或者 framework 内部结构时，通常使用 `internal` 访问级别)
8. `fileprivate` 访问级别：`fileprivate` 访问级别所修饰的实体只能在定义所定义的源文件中访问，使用 `fileprivate` 访问级别来隐藏在整个源文件中都可以使用到的函数的实现细节
9. `private` 访问级别：`private` 访问级别所修饰的实体只能在实体所定义的作用域内访问，如果定义在扩展中，则只能在扩展的作用域内进行访问；使用 `private` 访问级别来隐藏只能在其定义的作用域内使用的函数的实现细节
10. 总结：`open` 是最高的访问级别(最少的限制)，private 是最低的访问级别(最多的限制)
11. `open` 和 `public` 访问级别的区别(继承与重写的权限不同)
12. 访问级别规则：高访问级别的实体不能定义在低访问级别的类型中(`public` 修饰的变量不能定义在 `internal` 修饰的类型中；函数不能比它的参数类型以及返回值类型拥有更高的访问级别)
13. 默认访问权限(`internal`)
14. 开发应用程序中，如果想要隐藏实现细节，则可以使用 `fileprivate` 或者 `private` 访问级别来隐藏实现细节；如果是开发 framework，则对需要开放的 API 使用 `open` 或者 `public` 访问级别
15. 单元测试 target 可以使用 `@testable` 修饰导入的 `import` 声明，并且使用 testing 模式编译项目，则单元测试 target 可以访问任何 `internal` 实体
16. 元组的访问级别是元组中所有元素中访问限制最多的那个访问级别
17. 函数类型的访问级别是函数参数类型和返回值类型中访问限制最多的那个访问级别，如果函数访问级别与函数上下文环境访问级别不匹配的话，必须显示的指定函数的访问级别
18. 枚举类型定义的关联值类型或者原值类型都必须至少拥有与枚举类型本身访问级别高的级别(例如 `internal` 访问级别的枚举，不能使用 `private` 访问级别的类型来作为原值)
19. 子类的访问级别不能比父类拥有更高的访问级别
20. 重写的类成员可以比它的父类中的成员拥有更高的访问级别；在子类成员中调用父类中拥有更低访问级别的父类成员也是合法的；
21. 常量、变量或者属性不能比它们的类型的访问级别更 `public`，如果常量、变量或者下标使用的是 `private` 访问级别，那么常量、变量、属性或者下标必须使用 `private` 标记
22. 常量、变量或者下标的 getter 或者 setter 会自动接收与常量、变量、属性或者下标相同的访问级别
23. 我们可以给 setter 一个比其 getter 更低的访问级别，来限制该变量、属性或者下标的读写范围(`fileprivate(set)`、`private(set)`)
24. 上面的规则适用于存储属性和计算属性，即使我们没有为存储属性编写显式的 getter 和 setter，swift 仍然隐式为我们合成 getter 和 setter，以提供对存储属性后台存储变量的访问
25. 自定义初始化方法的访问级别低于或者等于其所在类型的访问级别；唯一的例外是 `required` 初始化方法，`required` 初始化方法必须与其所在的类型拥有相同的访问级别
26. 默认初始化方法与其所在的类型拥有相同的访问级别，除了类型被定义为 `public`。`public` 类型的默认初始化方法是 `internal` 访问级别的；`public` 的初始化方法必须显式的指定
27. 如果结构体的任何存储属性拥有 `private` 访问级别，则其 Memberwise 初始化方法是 `private` 访问级别，如果存储属性拥有 `fileprivate` 访问级别，则 Memberwise 初始化方法是 `internal` 访问级别的
28. 在定义协议的时候为协议显式的指定访问级别，协议要求的访问级别会自动设置成与协议自身相同的访问级别，不能更改协议要求的访问级别
29. `public` 访问级别的协议，则协议要求在被类型实现的时候，也必须要使用 `public` 访问级别
30. 定义新的协议继承自现有的协议，则新协议的访问级别最多与所继承自的协议的访问级别相同(例如，`public` 访问级别的协议不能继承 `internal`级别的访问协议)
31. 类型可以遵循比其访问级别更低的协议，但是类型中协议的实现只能在协议定义的模块中进行使用
32. 类型遵循特定协议的实现的访问级别上下文是类型自身的访问级别与协议访问级别之间的较小者
33. 不能在同一个程序中以两种不同的方式来遵循协议
34. 扩展中添加的成员都与在原类型中的成员类型拥有相同的默认访问权限，或者我们可以对扩展显式的使用访问级别(l例如，`private extension`)来对扩展中所有的成员设置新的默认访问级别；这个新的默认访问级别仍然可以在扩展中被成员重写；
35. 如果使用扩展来遵循协议，则不能显式的指定扩展的访问级别。在扩展中对协议要求的实现将默认的使用协议自身的访问级别；
36. 与类、结构体或者枚举在同一源文件中的扩展中的代码，与写在类型定义中的代码几乎一样，我们可以：1.在类型定义中声明的私有成员，可以在同一源文件中的类型扩展中使用这些私有成员；2.在类型的某个扩展中声明的私有成员，可以在同一源文件中的类型的另外一个扩展中使用这些私有成员；3.在类型的扩展中声明的私有成员，可以在同一源文件中的类型定义中使用这些私有成员；
37. 泛型类型或者泛型函数的访问级别是泛型类型或者泛型函数自身的访问级别与类型参数的任何类型约束的访问级别之间的较小者；
38. 类型别名的访问级别低于或等于原类型的访问级别，这同样适合于实现协议要求的关联类型

#### 第二十六章：高级运算
1. 位运算(`~`、`&`、`|`、`^`、`<<`、`>>`)
2. 无符号整数的左移与右移操作规则：1.现存的位数往左或者往右移动指定字数的位；2.任何超出整数存储位数的位，都将被忽略；3.位移多出的位用0填充
3. 有符号整数的左移操作规则：1.现存的位数往左移动指定字数的位；2.任何超出整数存储位数的位，都将被忽略；3.位移多出的位用0填充；4.符号位不变
4. 有符号整数的右移操作规则：1.现存的位数往右移动指定字数的位；2.任何超出整数存储位数的位，都将被忽略；3.位移多出的位用符号位填充；4.符号位不变
5. 值溢出操作(`&+`、`&-`、`&*`)
6. 二元运算符重载
7. 一元运算符重载
8. 复合赋值运算符重载(赋值运算符和三目运算符不能进行重载)
9. 相等运算符重载(遵循 `Equatable` 协议，实现对应方法)(实现相等运算符重载，不需要再实现不相等运算符重载)
10. 多数简单场景，我们可以让 swift 自动帮我们生成 `Equivalence` 操作方法，swift 会自动为满足以下规则的类型提供相应方法的实现：a.结构体只存在存储属性，并且这些属性都遵循了 `Equatable` 协议；b.枚举只存在关联类型，并且这些类型都遵循了 `Equatable` 协议；c.枚举类型不存在任何关联类型
11. 自定义运算符实现(`prefix operator +++`)
12. 中缀(`infix`)操作符优先级由优先组指定
13. 对同一操作符使用前缀和后缀操作符，首先执行的后缀操作符

