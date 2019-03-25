//
//  main.swift
//  Access Control
//
//  Created by ggl on 2019/1/7.
//  Copyright © 2019年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Access Control(4.2)

import Foundation

//MARK: - Modules and Source Files
//Swift的访问控制基于模块与源文件组成
//模块是一个单独的代码发布单元-framework或者应用程序，可以被swift以import关键字引入；
//Xcode中的每个target（应用程序包或者framework）在swift中都被视作一个分离的模块；如果将代码打包成framework（可能是为了封装代码以便在不同的应用程序中重用代码）在应用程序中导入或者在其他framework中使用，那么framework中的所有代码都属于模块的一部分；
//源文件指的是模块中的一个单独的swift源代码文件。除了可以在swift源文件中定义私有类型之外，还可以定义多种类型、函数等等；

//MARK: - Access Levels
//swift提供了五种不同的访问级别，这些访问级别与它们所修饰的实体所在的源文件有关联，也与源文件所在的模块有关联；
//*.open和public访问级别：open和public所修饰的实体可以在实体所在模块的任何swift源文件中访问，也可以在导入此模块的其他模块源文件中访问；当我们为framework指定公共接口时，通常会使用open和public访问级别；open和public的区别在下面介绍；
//*.internal访问级别：internal访问级别所修饰的实体可以在实体所在模块的任何swift源文件中访问，但是不能在其他模块中访问；当我们定义应用程序或者framework内部结构时，通常使用internal访问级别；
//*.fileprivate访问级别：fileprivate访问级别所修饰的实体只能在实体所定义的源文件中访问。使用fileprivate访问级别来隐藏在整个源文件中都可以使用到的函数的实现细节；
//*.private访问级别：private访问级别所修饰的实体只能在实体所定义的作用域内访问，如果定义在extension中则只能在extension作用域内访问；使用private访问级别来隐藏只能在其定义的作用域内使用的函数的实现细节；

//总结：open是最高（最少的限制）访问级别，private是最低（最多限制）访问级别

//open访问级别只能对类类型以及类成员使用，它和public的主要区别如下：
//1.public或者限制更多访问级别修饰的类，只能在类所定义的模块中定义子类；
//2.public或者限制更多访问级别修饰的类的成员，只能在类所定义的模块中被子类重写；
//3.open访问级别修饰的类，可以在类所定义的模块中定义子类，也可以在任何导入此模块的其他模块中定义子类；
//4.open访问级别修饰的类成员，可以在类所定义的模块中被子类重写，也可以在任何导入此模块的其他模块中被重写；

//MARK: - Guiding Principle of Access Levels
//swift中的所有的访问级别都遵循一个准则：拥有高（限制少）访问级别的实体不能在拥有低（限制多）访问级别中定义；
//例如：
//1.public修饰的变量不能定义在拥有internal、fileprivate、private访问级别的类型中，因为public所使用的地方，此类型不能全部满足；
//2.函数不能比它的参数类型以及返回值类型拥有更高的访问级别（限制少），因为函数可以在其参数类型以及返回值类型在当前调用函数的上下文中不可用的情况下使用；

//MARK: - Default Access Levels
//如果我们不指定访问级别的话，那么代码中几乎所有的地方（除了少部分特定的异常）都拥有默认的internal访问级别。所以，大多数时候我们都不需要指定访问级别；

//MARK: - Access Levels for Single-Target Apps
//如果是在单个target的应用程序中，不需要对其他模块开放代码。默认的internal访问级别就满足了这个条件，因此你不需要指定自定义的访问级别；代码的其他部分可以指定为fileprivate或者private访问级别来隐藏实现细节；

//MARK: - Access Levels for Frameworks
//如果是开发framework，对需要开放的API使用open或者public访问级别。

//MARK: - Access Levels for Unit Test Targets
//当我们开发带有单元测试的应用程序时，我们的代码需要对其他模块开放以便能够进行测试。默认的，只有被open或者public修饰的实体才能被其他模块访问。然而，如果我们对产品模块导入的import声明用@testable属性修饰，并且使用testing模式编译产品模块的话，则单元测试target可以访问任何internal实体；

//MARK: - Access Control Syntax
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

class SomeDefaultInternalClass {}           // implicitly internal
let someDefaultInternalConstant = 0         // implicitly internal

//MARK: - Custom Types
//在自定义类型的时候指定访问级别，自定义类型只能在其访问级别允许的范围内进行使用
public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0           // explicitly public class member
    var someInternalProperty = 0                // implicitly internal class member
    fileprivate func someFilePrivateMethods() {}// explicitly fileprivate class member
    private func somePrivateMethods() {}        // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                // implicitly internal class member
    fileprivate func someFilePrivateMethods() {}// explicitly fileprivate class member
    private func somePrivateMethods() {}        // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly fileprivate class
    func someFilePrivateMethods() {}            // implicitly fileprivate class member
    private func somePrivateMethods() {}        // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethods() {}                // implicitly private class member
}

//MARK: - Tuple Types
//元组类型的访问级别是元组的所有元素中访问限制最多的那个访问级别。例如，如果元组中有两种类型，一种类型是internal访问级别，另外一种类型是private访问级别，则整个元组的访问级别就是private访问级别；

//MARK: - Function Types
//函数类型的访问级别是函数参数类型和返回值类型中访问限制最多的那个访问级别。如果函数的访问级别与函数上下文环境的访问级别不匹配的话，我们必须显式的指定函数的访问级别；

//下面定义了一个全局函数someFunction()，函数自身没有显式的指定访问级别。我们可能猜测函数拥有默认的internal访问级别，但实际上不是。实际上，someFunction()函数不会通过编译；
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}

//上面的函数返回值类型为元组类型，根据上面的元组规则，元组类型的访问级别是private访问级别；因为函数的返回值类型是private访问级别，我们必须把函数的访问级别修改为private访问级别，这样函数的定义才是正确的；
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}

//对someFunction()函数使用public或者internal访问级别是不对的，或者使用默认的internal访问级别也是不正确的；因为public和internal访问级别的函数，对返回值类型为private访问级别的元素不能进行访问；

//MARK: - Enumeration Types
//枚举类型的每一个case都会自动接收与枚举类型自身访问级别相同的访问级别。我们不需要对枚举类型的每个case单独指定访问级别；
//下面例子中的枚举类型指定访问级别为public，north、south、east、west的访问级别也同为public；
public enum CompassPoint {
    case north
    case south
    case east
    case west
}

//MARK: - Raw Values and Associated Values
//在枚举类型定义的关联值类型或者原值类型都必须至少拥有与枚举类型本身访问级别高的级别；例如，对于internal访问级别的枚举类型，不能使用private访问级别的类型来作为原值。

//MARK: - Nested Types
//在private访问级别的类型中定义嵌套类型，则嵌套类型访问级别为private；在fileprivate访问级别类型中定义嵌套类型，则嵌套类型访问级别为fileprivate;在public或者internal访问级别的类型中定义嵌套类型，则嵌套类型的访问级别为internal；如果想让嵌套类型的访问级别为public，则必须显式的声明嵌套类型的访问级别为public；

//MARK: - Subclassing
//我们可以对当前上下文中访问到的类定义子类。子类的访问级别不能比父类拥有更高的访问级别；比如，你不能给internal父类定义public的子类；
//另外，只要在当前上下文中访问到的类，我们可以都可以重写类中的任何成员（方法、属性、初始化方法、下标操作等）

//重写的类成员可以比它的父类中的成员拥有更高的访问级别；在下面的例子中：类A是拥有public访问级别的类，它有一个fileprivate访问级别的函数someMethods().类B是类A的子类，拥有internal的访问级别；尽管如此，类B提供了拥有internal访问级别的重写函数someMethods().

public class A {
    fileprivate func someMethods() {}
}

internal class B: A {
    override internal func someMethods() {}
}

//在子类成员中调用父类中拥有更低访问级别的父类成员也是合法的，因为这发生在允许访问级别的上下文中；（在同一个源文件中调用了父类中fileprivate访问级别权限的成员；或者是在同一个模块中调用父类中internal访问级别权限的成员；）

public class A {
    fileprivate func someMethods() {}
}

public class B: A {
    override internal func someMethods() {
        super.someMethods()
    }
}

//因为类A和类B定义在同一个源文件中，所以在类B中重写someMethods()方法中调用父类的super.someMethods()方法也是可以的；

//MARK: - Constants, Variables, Properties, and Subscripts
//常量、变量或者属性不能比它们的类型的访问级别更public。例如不能定义拥有private访问级别类型的public访问级别属性。同样的，下标操作也不能比它的index类型和返回值类型的访问级别更public。
//如果常量、变量、属性或者下标使用的是private访问级别的类型，那么常量、变量、属性或者下标必须使用private标记；
private var privateInstance = SomePrivateClass()

//MARK: - Getters And Setters
//常量、变量以及下标的Getters和Setters会自动接收与常量、变量、属性或者下标相同的访问级别。
//我们可以给setter一个比其相应getter更低的访问级别，来限制该变量、属性或者下标的读写范围；通过在var或者subscript关键字前加上fileprivate(set)、private(set)或者internal(set)来实现setter的更低访问级别；
//此规则适用于存储属性和计算属性。即使我们没有为存储属性编写显式的getter和setter，swift仍然为我们隐式的合成getter和setter，以提供对存储属性的后台存储变量的访问。使用fileprivate(set)、private(set)和internal(set)来改变这个自动生成的setter的访问级别，与计算属性中的显式指定setter访问级别的方式相同。
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init() {}
}

//MARK: - Initializers
//自定义初始化方法的访问级别低于或者等于其所在的类型的访问级别；唯一的例外是required初始化方法，required初始化方法必须与其所在类型拥有相同的访问级别；
//与函数和方法的参数一样，初始化方法的参数不能比初始化方法自身访问级别更private；

//MARK: - Default Initializers
//默认初始化方法与其所在的类型拥有相同的访问级别，除了类型被定义为public；当类型被定义为public的时候，默认初始化方法是拥有internal访问级别的；如果我们想在其他模块中使用public访问级别的类型的不带有参数的初始化方法初始化时，我们必须要显式的提供拥有public访问级别的不带有参数的初始化方法。

//MARK: - Default Memberwise Initializers for Structure Types
//如果结构体的任何一个存储属性拥有private访问级别，则结构体的默认memberwise初始化方法被认为是private访问级别的。同样的，如果结构体的任何一个存储属性拥有fileprivate访问级别，则memberwise初始化方法是fileprivate的访问级别。否则，memberwise初始化方法是internal访问级别的；

//与上面介绍的初始化方法规则一样，如果我们想在其他模块中使用public的结构体中的memberwise初始化方法，我们必须在类型中显式的提供拥有public访问级别的memberwise初始化方法；

//MARK: - Protocols
//如果我们想给协议类型显式的指定访问级别，那么在定义协议的时候就需要指定；这可以让协议在特定的访问级别上下文中被遵循（使用）；
//协议中的每个要求的访问级别会自动的设置成与协议自身相同的访问级别。我们不能将协议要求的访问级别设置成协议自身不支持的访问级别；这确保所有的协议要求都可以在遵循协议的类型中可见；
//如果我们定义了public访问级别的协议，则协议要求在被类型实现的时候，也必须要使用public访问级别；这点与其他的类型不同，其他类型如果是拥有public访问级别，则类型的成员的访问级别隐式是internal级别的；

//MARK: - Protocol Inheritance
//如果定义新的协议继承自现有的协议，那么新协议的访问级别最多与所继承自的协议的访问级别相同。例如，我们不能定义public访问级别的协议来继承自internal访问级别的协议；

//MARK: - Protocol Conformance
//类型可以遵循比其访问级别更低的协议。例如，我们可以定义public访问级别的类型，遵循internal访问级别的协议，但类型中协议的实现只能在协议定义的模块中进行使用；
//类型遵循特定协议的实现的访问级别上下文是类型自身的访问级别与协议的访问级别之间的较小访问级别。如果类型是public访问级别，但是类型遵循的协议的访问级别是internal，那么类型遵循协议的实现的访问级别也是internal；
//当我们编写或者扩展类型来遵循协议的时候，我们必须确保类型中对协议要求的实现都至少拥有与协议自身与类型中较小访问级别相同的访问级别；例如，如果拥有public访问级别的类型遵循了internal访问级别的协议，类型中每个协议要求的实现都必须至少是internal访问级别；
//在swift中，就像在Objective-C中一样，协议一致性是全局的一类型不可能在同一个程序中以两种不同的方式遵循协议；

//MARK: - Extensions
//我们可以在可以访问到类、结构体或者枚举类型的上下文中对这些类型进行扩展；任何在扩展中添加的成员都与在原类型中的成员类型拥有相同的默认访问权限；如果我们对public或者internal类型进行扩展，任何新增加的成员都拥有默认的internal访问权限；如果我们对fileprivate的类型进行扩展，任何新增加的成员都拥有默认的fileprivate访问权限；如果我们对private类型进行扩展，任何新增加的成员都拥有默认的private访问权限；
//或者，我们可以对扩展显式的使用访问级别（例如，private extension）来对扩展中所有的成员设置新的默认访问级别；这个新的默认访问级别仍然可以在扩展中被成员重写；
//如果我们用extension来遵循协议，那么我们将不能显式的为extension指定访问级别；相反，在扩展中对协议要求的实现将默认的使用协议自身的访问级别；

//MARK: - Private Members in Extensions
//与类、结构体或者枚举类型在同一个源文件中的扩展中的代码，与代码写在类型定义中几乎一样；因此，你可以：
//1.在类型定义中声明的私有成员，可以在同一源文件中的类型扩展中使用这些私有成员；
//2.在类型的某个扩展中声明的私有成员，可以在同一源文件中的类型另外一个扩展中使用这些私有成员；
//3.在类型的扩展中声明的私有成员，可以在同一源文件中的类型定义中使用这些私有成员；

protocol SomeProtocol {
    func doSomething()
}

struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}


//MARK: - Generics
//泛型类型或者泛型函数的访问级别是泛型类型或者泛型函数自身的访问级别与类型参数的任何类型约束的访问级别之间的较小者；

//MARK: - Type Aliases
//为了进行访问控制，我们定义的任何类型别名都被认为与原类型不同。类型别名的访问级别低于或者等于原类型的访问级别。例如，private、fileprivate、internal、pubic或者open访问级别的类型可以定义出private类型的别名；但是internal、fileprivate或者private访问级别的类型不能定义出public访问级别的别名；
//这个规则同样适用于实现协议要求的关联类型；

