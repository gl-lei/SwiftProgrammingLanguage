# SwiftProgrammingLanguage
The Swift Programming Language's Translation For Chinese(4.2 version)

Swift编程语言翻译（4.2版本）

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
1. 析构方法在类实例被销毁之前调用，使用 `deinit` 关键字
2. swift 采用自动自动引用计数的方式管理内存，我们几乎不需要在 `deinit` 方法里面编写内存释放的代码
3. 子类会继承父类的析构方法，析构方法会自动被调用；父类的析构方法也会被自动调用；

