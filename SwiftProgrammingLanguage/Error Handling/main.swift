//
//  main.swift
//  Error Handling
//
//  Created by gl on 2017/1/23.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Error Handling(4.2)

import Foundation

//MARK: - Representing and Throwing Errors
//Swift中，通过遵循Error协议来实现错误处理。枚举类型是比较适合用来处理错误相关逻辑的类型。
//Error协议其实是空协议，里面没有任何需要实现的属性或者方法
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
//使用throw来抛出异常
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//MARK: - Handling Errors
//这里有四种方式来处理swift中的错误。
//1.我们可以将错误抛给外层的函数；
//2.我们可以使用do-catch语句处理错误；
//3.我们可以将错误作为可选类型来处理；
//4.我们可以使用断言来进行处理；

//MARK: - Propagating Errors Using Throwing Functions
//将throws写在函数声明的参数列表后面表示这个函数可能会抛出异常(不声明的函数无法处理异常)
func canThrowErrors() throws -> String {
    return "可能会抛出异常"
}

func cannotThrowErrors() -> String {
    return "不能抛出异常"
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
}

//MARK: - Handling Errors Using Do-Catch
//格式：
/*******************
 do {
 try expression
 statement
 } catch pattern 1 {
 statements
 } catch pattern 2 where condition {
 statements
 }
 ********************/

/*
 var vendingMachine = VendingMachine()
 vendingMachine.coinsDeposited = 8
 
 do {
 try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
 } catch VendingMachineError.invalidSelection {
 print("Invalid Selection.")
 } catch VendingMachineError.outOfStock {
 print("Out of Stock.")
 } catch VendingMachineError.issufficientFunds(let coinsNeeded) {
 print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
 }
 */

//MARK: - Converting Errors to Optional Values
//通过使用try?将错误转换成一个Optional变量。如果try?返回一个错误，那么表达式的值就是nil.

func throwingFunction() throws -> Int {
    return 23
}

let x = try? throwingFunction()

let y: Int?
do {
    y = try throwingFunction()
} catch {
    y = nil
}

//如果throwingFunction函数抛出异常，则x和y的值都为nil。否则，x和y的值都是函数返回的值。

//MARK: - Disabling Error Propagation
//如果我们确定函数不会发生异常，则使用try!。如果发生异常的话会得到一个运行时错误。

let photo = try! loadImage(atPath: "./Resources/John/Appleseed.jpg")


//MARK: - Specifying Cleanup Actions
//在代码在执行过程中快要离开当前代码块之前，我们可以使用defer语句来执行一些语句。这些语句可以让我们执行一些必须得清理工作而不论执行流程是否离开当前代码块。(无论是抛出异常、return语句或者break语句)
//defer语句的执行在当前作用域结束之后
func processFile(fileName: String) throws {
    if exists(filename) {
        let file = open(filename)
        
        defer {
            close(file)
        }
        
        while let line = try file.readline() {
            //执行一些操作
        }
        
        //close(file)将会在这里被调用，在作用域的结束的地方。
    }
}


