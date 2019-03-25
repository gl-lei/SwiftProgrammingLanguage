//
//  main.swift
//  Collection Types
//
//  Created by gl on 16/8/24.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Collection Types(5.0)

import Foundation

//Swift提供了三种私有容器类型：Array、Set、Dictionary。Array容器是有序容器，Set容器为无序容器且存储的元素唯一(把一个元素往Set中加入两次，则还是只有一个)，Dictionary为键值对形式存储。
//Swift中的这三种容器的类型都是确定的，不能将不同类型的对象加入到容器中(泛型)。

//MARK: - Mutability of Collections
//当初始化容器赋值给一个变量的时候，代表这个容器是可变的。赋值给一个常量的时候，代表这个容器是不可变的。建议使用不可变的容器，效率会比较高。

//MARK: - Arrays
//数组里面存储着相同类型的元素，元素可以是重复的。Swift中的数组与NSArray是桥接关系。

//MARK: - Array Type Shorthand Syntax
//数组的书写形式：Array<Element>，Element是数组的元素类型。或者可以简写为[Element]。建议使用简写形式。

//MARK: - Creating an Empty Array
var someInts = [Int]()
print("someInts is of type of [Int] with \(someInts.count) items.")

//如果知道了数组的类型，例如函数参数或者已经存在的数组类型，可以使用空数组字面值([])来创建一个空数组。
someInts.append(3)
someInts = []

//MARK: - Creating an Array with a Default Value
var threeDoubles = [Double](repeating: 0.0, count: 3)
print("threeDoubles: \(threeDoubles).")

//MARK: - Creating an Array by Adding Two Arrays Together
//我们可以通过+操作符合并两个数组来创建一个新的数组，新数组的类型来自合并的数组类型
var anotherThreeDoubles = [Double](repeating: 2.5, count: 3)
var sixDoulbes = threeDoubles + anotherThreeDoubles

//MARK: - Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]

//MARK: - Accessing and Modifying an Array
//通过方法和属性或者通过使用下标操作来访问和修改数组元素
print("The shopping list contains \(shoppingList.count) items.")

//使用isEmpty属性来检测count属性是否为0
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

//使用append(_:)来增加元素
shoppingList.append("Flour")
print(shoppingList)

//使用+=操作符来添加另外数组的元素到本数组
shoppingList += ["Baking Powder"]
print(shoppingList)

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingList)

//使用下标来访问数组的元素
var firstItem = shoppingList[0]
print("the array's first item is: \(firstItem).")

//使用下标来改变当前元素的内容
shoppingList[0] = "Six eggs"

//使用下标语法来一次性改变指定范围内的元素
shoppingList[4...6] = ["Bananas", "Apples"]

//需要注意的是，我们不能使用下标语法来给数组增加一个新元素
//在指定的位置给数组插入一个新的元素，使用insert(_:at:)方法
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

//移除指定位置的元素，使用remove(at:)方法
let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)

//移除最后一个元素，使用removeLast()方法而不是使用removeAtIndex(_:)方法来避免查询数组的count属性需求
let apples = shoppingList.removeLast()

//MARK: - Iterating Over an Array
//使用for-in来遍历数组
for item in shoppingList {
    print(item)
}

//如果需要每个元素的下标的话，则使用enumerated()方法来遍历数组。对数组中的每个元素来说，enumerate()方法会返回包含有每个元素下标和值的元组。
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//MARK: - Sets
//Set容器是存储了不同元素的无序容器，当我们想确保确保容器中元素只出现一次或者容器中元素的顺序不重要，我们可以选择使用Set容器。
//Swift中的Set容器与NSSet类相桥接

//Hash Value for Set Types
//Set容器中的类型都必须提供哈希值的(hashable)，因此如果想要存储在Set容器里面就要为自己提供一种方式来计算哈希值。哈希值是一种Int类型的值，用来比较对象是否同等，对于所有的对象都适用。比如，if a == b，那么则是a.hashValue === b.hashValue。
//所有Swift的基本类型(String、Int、Double、Bool)默认都是提供哈希值的，都可以用来作为Set容器的元素或者字典的键类型。不带有关联值的枚举类型默认也是提供哈希值的。
//我们自定义的类型可以通过遵循Hashable协议来为类型提供哈希值。遵循Hashable协议需要实现hashValue属性来返回Int类型的哈希值。返回的哈希值在相同程序的不同运行下结果不要求相同，或者不同程序下。
//因为Hashable协议遵循了Equatable协议，所以也必须要提供==操作符的实现。实现==操作符要符合以下三种情况：
// 1. a == a
// 2. a == b 也意味着 b == a
// 3. a == b && b == c 也意味着 a == c

//MARK: - Set Type Syntax
//Set类型需要写成Set<Element>形式，Element为类型，没有简写形式。

//MARK: - Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

//如果知道Set容器的类型，则可以：
letters.insert("a")

letters = []        //letters仍然为Set<Character>类型，里面的元素为0个。

//MARK: - Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

//Set类型不能从数组字面值中推断出来，所以必须要显示指明类型。然后，因为Swift的类型推断，如果数组字面值的类型包含的类型一样，你不需要显示的写出Set容器的类型
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]

//MARK: - Accessing and Modifying a Set
//通过方法和属性来访问和修改Set容器
//使用count属性来查看Set容器里面的元素个数
print("I have \(favoriteGenres.count) favorite music genres.")

//使用isEmpty属性来检测count属性是否为0
if favoriteGenres.isEmpty {
    print("As far as music goes. I'm not picky.")
} else {
    print("I have particular music preferences.")
}

//调用insert(_:)方法向Set容器中插入数据
favoriteGenres.insert("Jazz")

//调用remove(_:)方法移除指定的元素，方法返回被移除的元素或者返回nil。或者调用removeAll()方法移除所有的元素
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

//检测是否包含一个特定的元素，使用contains(_:)方法。
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

//MARK: - Iterating Over a Set
//可以使用for-in循环遍历容器里面的元素
for genre in favoriteGenres {
    print("\(genre)")
}

//Swift类型的Set容器中的元素是没有顺序的，为了能够按照顺序去遍历，使用sorted()方法来对元素进行排序(元素按照<操作符进行排序)
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//MARK: - Performing Set Operations
//我们可以有效率的执行Set容器的一些操作，比如合并两个Set容器，获取两个容器之间的共同值之类的操作。

//MARK: - Fundamental Set Operations
//使用intersection(_:)方法来创建一个新的Set容器，Set容器包含两个Set容器之间的共同值。
//使用symmectricDifference(_:)方法来创建一个新的Set容器，Set容器包含两个Set容器的除了共有值外的所有值。
//使用union(_:)方法来创建一个新的Set容器，包含两个容器里面所有的值。
//使用subtracting(_:)方法来创建一个新的Set容器，不包含指定容器里面的所有值。
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()      //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()  //[]
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()   //[1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()   //[1, 2, 9]

//MARK: - Set Membership and Equality
//使用==操作符来比较两个Set容器里面的元素是否相同
//使用isSubsetOf(_:)方法来判断一个容器是否是另外一个容器的子集。
//使用isSuperOf(_:)方法来判断一个容器是否是另外一个容器的超集。
//使用isStrictSubsetOf(_:)方法或者isStrictSupersetOf(_:)方法来判断一个容器是另外一个容器的绝对子集或者超集。(不包括相等的情况)
//使用isDisjoinWith(_:)方法来决定两个容器是否不包含共有值。

//MARK: - Dictionaries
//Key是唯一的，Value不是唯一的。Swift中的字典与NSDictionary是桥接的。

//MARK: - Dictionary Type Shorthand Syntax
//字典类型的全写形式Dictionary<Key, Value>，Key需要遵循Hashable协议，就像set容器的元素类型一样。
//简写形式：[Key: Value]，推荐使用简写形式。

//MARK: - Creating an Empty Dictionary
var namesOfIntegers = [Int: String]()

//如果知道类型的话，则可以省略类型
namesOfIntegers[16] = "Sixteen"
namesOfIntegers = [:]

//MARK: - Creating a Dictionary with a Dictionary Literal
//使用字典字面值来创建字典对象
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//可以省略类型
var airports1 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//MARK: - Accessing and Modifying a Dictionary
//我们可以通过方法、属性或者下标来访问和修改字典对象
//使用count属性来获取字典对象的键值对个数
print("The airports dictionary contains \(airports.count) items.")

//使用isEmpty属性来检测count属性是否等于0
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

//可以通过下标操作来添加新的键值对
airports["LHR"] = "London"

//也可以通过下标操作语法来改变键对应的值
airports["LHR"] = "London Heathrow"

//还可以通过updateValue(_:forKey:)方法来添加或者更新键值对。updateValue(_:forKey:)方法会返回旧值，这可以让你得知更新是否发生。(返回值为Optional类型)
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

//我们可以通过下标操作来返回键对应的值
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

//通过使用下标语法来给对应键赋值nil来移除键值对
airports["APL"] = "Apple International"
airports["APL"] = nil

//还可以使用removeValue(forKey:)方法来移除指定的键值对，方法返回旧值。
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//MARK: - Iterating Over a Dictionary
//使用for-in循环来遍历字典，每个键值对采用元组的形式(key, value)
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//还可以遍历字典的所有键和所有的值(Keys和Values属性)
for airportCode in airports.keys {
    print("Airport code : \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//如果需要使用字典的key或者value组成数组类型，则使用其来初始化为数组
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//Swift的字典类型是无序的，如果想让键或者值有序，则对keys或者values属性使用sort()方法
