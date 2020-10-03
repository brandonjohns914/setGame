//
//  Deck.swift
//  SetGameFinal
//
//  Created by Brandon Johns on 9/29/20.
//

import Foundation


struct Deck
{
     private(set) var cards = [Card]()

     /// creates empty deck
    init()
    {
        var cardInDeck = [Card]()
        for colors in Card.Color.all
        {
            for symbols in Card.Symbol.all
            {
                for shades in Card.Shade.all
                {
                    for numbers in Card.Number.all
                    {
                        cardInDeck.append(Card(identifier: 0,  number: numbers, color: colors, shade: shades, symbol: symbols))
                        
                    }
                }
            }
        }
        cards = cardInDeck.shuffled()
    }
    
    mutating func randomCard() -> Card? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        }
        return nil
    }
    
}
