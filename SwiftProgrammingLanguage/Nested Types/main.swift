//
//  main.swift
//  Nested Types
//
//  Created by gl on 2017/1/23.
//  Copyright © 2017年 gl. All rights reserved.
//  SwiftProgrammingLanguage - Nested Types(4.2)

import Foundation

//枚举类型经常被创建来支持特定的类或者结构体的功能。swift支持创建嵌套类型，因此你可以定义嵌套支持的枚举类型、类类型、结构体类型到它们所支持的类型定义中。

struct BlackjackCard {
    
    //嵌套Suit枚举类型
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
        
    }
    
    //嵌套Rank枚举类型
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue), "
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        
        return output
    }
}

//引用嵌套类型
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue

