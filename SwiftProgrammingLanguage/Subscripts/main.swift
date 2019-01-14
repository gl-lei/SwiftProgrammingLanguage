//
//  main.swift
//  Subscripts
//
//  Created by gl on 16/9/8.
//  Copyright © 2016年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Subscripts(4.2)

import Foundation

//MARK: - Subscripts
//类、结构体和枚举都可以定义下标操作。

//MARK: - Subscript Syntax
//通过subscript关键字来定义下标操作，下标操作可以可读可写或者只读的。
//定义set方法的时候，默认的参数为newValue，类型与定义下标操作返回的类型一致。当只定义只读的下标操作时，可以将get{}删掉.
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


//MARK: - Subscript Usage
//Swift的Dictionary类型实现了下标操作,实际上是实现了key-value下标操作
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2


//MARK: - Subscript Options
//下标操作可以接收不限个数的参数，这些参数类型也不限制，并且下标操作返回的类型也不限制。下标操作可以接收可变参数类型，但是不能使用in-out类型的参数，也不能为参数指定默认值。
//下标操作可以通过重载的方式提供很多个。
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValidFor(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && columns >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidFor(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        
        set {
            assert(indexIsValidFor(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
            
        }
    }
}
