//
//  Card.swift
//  SetGameFinal
//
//  Created by Brandon Johns on 9/28/20.
//

import Foundation
struct Card: Hashable, CustomStringConvertible
{
    var hashValue: Int {return identifier}
    var identifier: Int
    private static var identifierFactory  = 0
    let number: Number
    let color: Color
    let shade: Shade
    let symbol: Symbol
    
    // required by Custom String Convert
    var description: String
    {
        return "Card: \(number) \(symbol) \(shade) \(color) "
    }
    
    private static func getUniqueIdentifier() -> Int
    { identifierFactory += 1
        return identifierFactory
    }
    enum Color: CardInfo
    {
        case Color1
        case Color2
        case Color3
        static var all: [Card.Color]
        {
            return[.Color1, .Color2, .Color3]
        }
    }
    enum Symbol: CardInfo
    {
        case Symbol1
        case Symbol2
        case Symbol3
        static var all: [Card.Symbol]
        {
            return [.Symbol1, .Symbol2, .Symbol3]
        }
    }
    
    enum Number: CardInfo
    {
        case one
        case two
        case three
        static var all: [Card.Number]
        {
            return[.one, .two, .three]
        }
    }
    
    enum Shade: CardInfo
    {
        case Shade1
        case Shade2
        case Shade3
        
        static var all: [Card.Shade]
        {
            return [.Shade1 , .Shade2 , .Shade3]
        }
    }
}
protocol CardInfo
{
    static var all: [Self] { get }
}


