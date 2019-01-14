//
//  main.swift
//  String and Characters
//
//  Created by gl on 16/8/13.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - String and Characters(4.2)

import Foundation

//Swift中的字符串类型用String类表示，String类由Character值组成。String类与NSString类属于桥接关系，NSString的API完全可以在String类上面调用。

//MARK: - String Literals
let someString = "Some string literal value"

//多行字符串常量
let quotation = """
The White Rabbit put on his spectacles. "Where shall I begin,
plase your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

//如果您想使用换行符来简化源代码，但是您不希望换行符成为字符串值的一部分，请在这些行的末尾写一个反斜杠
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

//可以缩进多行字符串以匹配周围的代码。在结束引号（"""）之前的空格告诉Swift在所有其他行之前要忽略哪些空格。
//但是，如果你在行的开头写一个空白，除了在结束引号之前的那些空格之外，那个空格是包括在内。
let linesWithIndentation = """
    this line doesn't begin with whitespace.
        this line begins with four spaces.
    This line doesn't begin with whitespace.
    """
print("lineWithIndentation" + linesWithIndentation)

//MARK: - Initializing an Empty String
var emptyString = ""
var anotherEmptyString = String()

//检查String值是否为空，调用isEmpty属性
if emptyString.isEmpty {
    print("Nothing to see here")
}

//MARK: - String Mutability
var variableString = "Horse"
variableString += " and carriage"

//MARK: - Strings Are Value Types
//当将一个字符串传递给函数的时候，会将字符串copy一份给形参，赋值给一个常量或者变量的时候也是这样。
//在编译器处理的时候，会进行优化，只有在确切发生值变化的时候才会发生拷贝，所以我们不用担心影响效率。

//MARK: - Working with Characters
//我们可以通过遍历String类型的characters属性来访问字符串里面的Character值。
for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"            //创建单独的字符类型
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let cat = String(catCharacters)
print(cat)

//MARK: - Concatenating String and Characters
//String类型可以通过+来连接起来
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

//也可以通过+=来进行连接
var instruction = "look over"
instruction += string2

//通过String类的append()方法来添加字符(Character类型)
let textCharacter: Character = "!"
welcome.append(textCharacter)

//需要注意的是，不能通过append()方法给Character变量添加字符串或者字符，因为character类型只能包含一个字符。

//MARK: - String Interpolation
//String类型的插入，可以通过插入来创建新的String类型
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//MARK: - Unicode
//Unicode是一种国际编码标准，用来代表、处理不同操作系统中的文字。它几乎可以代表任何语言的任何字符，可以读取或者写入到文件或者网页中。Swift中的String和Character类型全都兼容Unicode编码格式。

//MARK: - Unicode Scalars
//String类型是建立在Unicode标量值上面的。Unicode标量采用唯一的21位数字来表示一个字符。
//Unicode标量是在U+0000到U+D7FF(包括首尾)或者在U+E000到U+10FFFF(包括首尾)范围内的一个码位。Unicode标量不包括代理对(Surrogate Pair，UTF-16中用于扩展字符而使用的编码方式)，代理对是在U+D800到U+DFFF之间的码位。
//需要注意的是，并不是所有的Unicode标量都被使用了，许多标量被保留来用作将来用途。被使用的标量通常都会有一个名称，比如小写拉丁字母(LATIN SAMLL LETTER)。这些名称使用了固定的Unicode标量范围。

//MARK: - Special Characters in String Literals
//String字面值可以包含以下特殊字符：
//1. 特殊用途字符：\0(空字符)，\\(反斜线)，\t(制表符)，\n(换行符)，\r(回车符)，\"(双引号)，\'(单引号)
//2. 特殊的Unicode码位：\u{n}，其中n是一个1~8个十六进制数字。
let dollarSign = "\u{24}"       //$, U+0024
let blackHeart = "\u{2665}"     //黑心符号，U+2665

//MARK: - Extended Grapheme Clusters(扩展字形集)
//每个Charcater类型对象都代表一个单一的扩展字形集。扩展字形集表示的是一个或者多个Unicode标量序列产生单一的人类可读字符。
//有一个例子，字母é可以用单个Unicode标量表示，也可以通过一对Unicode标量来表示。无论哪种情况下，字母é都被当做Swift的单个字符。
let eAcute: Character = "\u{E9}"
let combineEAcute: Character = "\u{65}\u{301}"
print("\(eAcute) == \(combineEAcute)")

//扩展字形集是采用一种灵活的方式来表示许多复杂的文本字符，这些字符都可以作为单个字符值进行存储。

//MARK: - Counting Characters
//获取String对象中Character值的数量，使用String对象的characters属性的count属性。
let unusualMessagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("count: \(unusualMessagerie.count).")

//需要注意，Swift采用了扩展字形集，这意味着对字符串修改可能不会改变字符串的长度。
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"

//同样，不同的字符串还有相同的字符串的不同表示形式，它们需要的内存存储空间不同。因此，相同的字符串可能使用了不同的内存存储空间。如果不通过遍历来确定是否采用了扩展字形集，我们就无法确定一个字符串中字符的个数。在处理长字符串的时候，一定要注意，必须遍历所有的Unicode标量，才能确定字符串中的每个字符。

//字符串的count属性返回的字符个数与NSString的length属性返回的结果不一定相同。NSString是基于16位编码单元-字符串的UTF-16编码来表示的，扩展字形集没有包括在内。

//MARK: - Accessing and Modifying a String
//可以通过方法、属性或者下标来访问和修改一个字符串的值。

//MARK: - String Indices
//String类型有一个关联的index类型：String.Index类型，代表了字符串中字符的位置。
//由于不同的字符占用不同的存储空间，为了确定字符的位置，我们必须要遍历整个字符串。所以，Swift中的String类型不能直接通过整型的下标来进行表示。
//使用startIndex来表示字符串的第一个字符，endIndex表示字符串最后一个字符的下一个位置。所以在字符串中，endIndex不是一个合法的位置。如果字符串为空串，则startIndex和endIndex的值一样。
//我们可以通过String的方法index(before:)和index(after:)方法来访问给定index位置的上一个字符和下一个字符。我们还可以使用index(_:offsetBy:)方法来访问指定偏移位置的字符。
let greeting = "Guten Tag!"
let startCh = greeting[greeting.startIndex]
print(startCh)

let preCh = greeting[greeting.index(before: greeting.endIndex)]
print(preCh)

let succeCh = greeting[greeting.index(after: greeting.startIndex)]
print(succeCh)

let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])

//如果访问不存在的下标位置，则引发运行时错误
//print(greeting[greeting.endIndex])
//greeting.index(after: greeting.endIndex)

//使用字符串的indices属性来访问字符串中的所有的字符
for index in greeting.indices {
    print("\(greeting[index])")
}

//注意您可以在符合Collection协议的任何类型上使用startIndex和endIndex属性以及索引（before :)，
//index（after :)和index（_：offsetBy :)方法。
//这包括String，如此处所示，以及集合类型，如Array，Dictionary和Set。

//MARK: - Inserting and Removing
//在特定的位置插入一个字符，使用insert(_:at:)方法
var wel = "hello"
wel.insert("!", at: wel.endIndex)
print(wel)

//在指定的位置插入字符串，使用insert(contentsOf:at:)方法
wel.insert(contentsOf: " there", at: wel.index(before: wel.endIndex))
print(wel)

//在指定的位置移除字符使用remove(at:)方法
wel.remove(at: wel.index(before: wel.endIndex))
print(wel)

//移除字符串子串，使用removeSubrange(_:)方法
let range = wel.index(wel.endIndex, offsetBy: -6)..<wel.endIndex
wel.removeSubrange(range)
print(wel)

//注意您可以在符合RangeReplaceableCollection协议的任何类型上使用insert（_：at :)，
//insert（contentsOf：at :)，remove（at :)和removeSubrange（_ :)方法。
//这包括String，如此处所示，以及集合类型，如Array，Dictionary和Set。

//MARK: - Substrings
//当我们使用下标或者prefix(_:)方法获得字符串的子串时，返回的结果类型是Substring，而不是字符串类型。
//Substring类型与字符串类型拥有绝大部分相同的方法，我们可以将其当做字符串来进行处理
//然而，和字符串不同的是，在对字符串执行操作时，我们对子串仅仅使用很短的时间。
//如果你准备使用子串结果来操作很长时间，你需要将子串转换成字符串类型

let greeting1 = "Hello, World!"
let ind = greeting1.index(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<ind]
print("beginning is \(beginning)")

let newStrign = String(beginning)

//子串不适合长期存储 - 因为它们重用原始字符串的存储，只要正在使用任何子字符串，整个原始字符串就必须保存在内存中

//MARK: - Comparing Strings
//Swift提供了三种方式来比较文本值：字符串和字符的相等，前缀相等，后缀相等

//MARK: - String and Chararcter Equality
//使用==和!=来进行比较
let strCom1 = "We're good."
let strCom2 = "We're good."
if strCom1 == strCom2 {
    print("str equal")
}

//如果两个字符串的扩展字形集是规范等价的，则两个字符串被认为是相等的。当字符拥有相同的语义和外在表现，则扩展字形集被认为是规范等价的，即使它们采用的是不同的Unicode标量。如果只是外在表现相同，不能认定它们是相等的。
let eAcute1 = "Voulez-vous un caf\u{E9}?"
let eAcute2 = "Voulez-vous un caf\u{65}\u{301}?"
if eAcute1 == eAcute2 {
    print("This is equal")
}

let a1 = "\u{41}"
let a2 = "\u{0410}"
if a1 != a2 {
    print("This is not equal")
}

//注意，Swift中的字符串和字符的比较不是区域敏感的。

//MARK: - Prefix and Suffix Equality
//字符串前缀比较使用hasPrefix(_:)方法，后缀比较使用hasSuffix(_:)方法。同样遵循扩展字形集的规范等价比价。
let strT = "Good Choice"
if strT.hasPrefix("Good") {
    print("\(strT) has the prefix \"Good\".")
}

if strT.hasSuffix("Choice") {
    print("\(strT) has the suffix \"Choice\".")
}

//MARK: - Unicode Representations of Strings
//当Unicode字符串写入到文件中或者其他存储地方的时候，字符串中的Unicode标量被一个或者多个编码形式进行编码。每一种编码形式都将字符串编码为小块，这些小块被称为编码单元。它们包括UTF-8编码形式(8位编码单元)、UTF-16编码形式(16位编码单元)、UTF-32编码形式(32位编码单元)。
//Swift提供了几种不同的方式来访问字符串的Unicode表示，我们可以使用for-in语句来访问字符串的Character值，除此之外还有三种兼容Unicode编码的表示形式：
//1. UTF-8编码单元集合(通过字符串的utf8属性来访问)
//2. UTF-16编码单元集合(通过字符串的utf16属性来访问)
//3. UTF-32编码单元集合，与21位的Unicode标量值集合等价(通过字符串的unicodeScalars属性来访问)

//MARK: - UTF-8 Representation
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
//68 111 103 226 128 188 240 159 144 182
//68 111 103对应D o g字符，226 128 188对应‼字符，240 159 144 182对应🐶

//MARK: - UTF-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
//68 111 103 8252 55357 56374
//68 111 103对应D o g字符，8252对应‼字符，55357 56374对应🐶

//MARK: - Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
//68 111 103 8252 128054
//68 111 103对应D o g字符，8252对应‼字符，128054对应🐶

//UnicodeScalar值除了可以访问它的value值外，还可以使用它来构建一个新的字符串
for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}


