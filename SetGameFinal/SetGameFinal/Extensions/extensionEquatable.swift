//
//  extensionEquatable.swift
//  SetGameFinal
//
//  Created by Brandon Johns on 10/1/20.
//

import Foundation

extension Card: Equatable
{
static func ==(lhs: Card, rhs: Card) -> Bool
{
    lhs.identifier == rhs.identifier && lhs.color == rhs.color &&
        lhs.symbol == rhs.symbol &&
        lhs.number == rhs.number &&
        lhs.shade == rhs.shade
}

}
