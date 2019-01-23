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
2. 数组 `sorted(by:_)` 方法解析
3. `sorted(by:_)` 方法闭包的书写形式(省略参数类型和返回值类型；单语句闭包省略return关键字(单语句闭包隐式返回表达式的值)；省略参数类型、参数名称以及返回值类型，使用 $0、$1...；使用操作符(>、<))
4. 尾闭包的定义(Trailing Closures)
5. 尾闭包的书写形式(不写参数标签，闭包写在函数小括号后面)
6. 尾闭包的简写形式(闭包作为唯一参数，可以省略函数的一对小括号)
7. 闭包持有变量或者常量(闭包可以持有作用域内的常量和变量，并且可以修改这些变量的值，即使这些变量定义的作用域不存在了)
8. 闭包类型是引用类型(不是值类型)(注意循环引用的问题)
9. 逃离闭包的定义(Escaping Closures)(@escaping)
10. 在逃离闭包中需要显式使用 `self`，非逃离闭包可以不用
11. 自动闭包(Autoclosures)的定义(@autoclosure)(不要过多的使用)
