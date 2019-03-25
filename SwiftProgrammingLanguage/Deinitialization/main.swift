//
//  main.swift
//  Deinitialization
//
//  Created by gl on 2017/1/22.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Deinitialization(3.0)

import Foundation

//MARK: - How Deinitialization Works
//swift会自动释放我们不再使用的对象实例内存，不需要我们手动编写释放对象代码；
//析构方法在类实例被释放的时候调用，可以在析构方法中做一些文件关闭等操作

deinit {
    
}

//子类会继承父类的析构方法，析构方法会自动被调用。父类的析构方法也会被自动调用。

