//
//  SetGame.swift
//  SetGameFinal
//
//  Created by Brandon Johns on 9/28/20.
//

import Foundation
import UIKit

class SetGame
{
    private(set) var cardDeck = Deck()
    private(set) var cards = [Card]()
    var score = 0
    
    private(set) var selectedCards = [Card]()
    private(set) var cardsNotInPlay = [Card]()
    private(set) var cardsInPlay = [Card]()
    var matchedCards = 0
    
    // initializing deck setting first 12 cards
    init()
    {
        for _ in 0..<12
        {
            if let cardToAppend = cardsDealt()
            {
                cardsInPlay.append(cardToAppend)
            }
        }
    }
    
    
    //providing random card from deck
   private func cardsDealt() -> Card?
    {
        return cardDeck.randomCard()
    }
/// user choosing card
    func chooseCard(card: Card)
    {
        
        // checking if 3 cars and makes a est
         if selectedCards.count == 3 && isSet()
         {
             selectedCards.forEach
             {
                if let selectedIndex = cardsInPlay.firstIndex(of: $0)
                 {
                     cardsInPlay.remove(at: selectedIndex)
                     if cardsNotInPlay.count > 0
                     {
                         let selectedCard = cardsNotInPlay.remove(at: cardsNotInPlay.count.arc4random)
                         cardsInPlay.insert(selectedCard, at: selectedIndex)
                     }
                 }
             }
             selectedCards.removeAll()
             score += 3
             matchedCards += 1
            //print(" a set +3 and amount of sets +1 ")
         }
         else if selectedCards.count == 3 && !isSet()
         {
             selectedCards.removeAll()
             score -= 4
            //print(" not a set -4")
         }
         
        if let cardselect = selectedCards.firstIndex(of: card)
        {
             selectedCards.remove(at: cardselect)
            score -= 1
            //print("deselect -1")
         }
        else
        {
             selectedCards.append(card)
         }
     }
    //creating set
    private func isSet() -> Bool {
       
        if selectedCards.count != 3
        {
            return false
        }
        // checking color 1 and 3
        if selectedCards[0].color == selectedCards[1].color
        {
            if selectedCards[0].color != selectedCards[2].color
            {
                return false
            }
        }
        // checking color 1 2
        else if selectedCards[1].color == selectedCards[2].color
        {
            return false
        }
        /// checking color 0 2
        else if (selectedCards[0].color == selectedCards[2].color)
        {
            return false
        }
        // checking numbers 0 1
        if selectedCards[0].number == selectedCards[1].number
        {
            if selectedCards[0].number != selectedCards[2].number
            {
                return false
            }
        }
        // checking  number 1 2
        else if selectedCards[1].number == selectedCards[2].number
        {
            return false
        }
       // checking number 0 2
        else if (selectedCards[0].number == selectedCards[2].number)
        {
            return false
        }
        // checking shading 0 1
        if selectedCards[0].shade == selectedCards[1].shade
        {
            if selectedCards[0].shade != selectedCards[2].shade
            {
                return false
            }
        }
        // checking shading 1 2
        else if selectedCards[1].shade == selectedCards[2].shade {
            
            return false
            
        }
        // checking shading 0 2
        else if (selectedCards[0].shade == selectedCards[2].shade)
        {
            return false
        }
        // checking symbols 0 1
        if selectedCards[0].symbol == selectedCards[1].symbol
        {
            if selectedCards[0].symbol != selectedCards[2].symbol
            {
                return false
            }
        }
        // checking symbols 1 2
        else if selectedCards[1].symbol == selectedCards[2].symbol
        {
            return false
        }
        // checking symbols 0 2
        else if (selectedCards[0].symbol == selectedCards[2].symbol)
        
        {
            return false
        }
        return true
    }
    //new game func
    func newGame()
    {
        score = 0 // reset score to 0
        cardsNotInPlay.removeAll() // remove all cards in deck
        cardsInPlay.removeAll()  // remove all cards on screen
        selectedCards.removeAll() // remove user seelected cards
    }
    //dealing three cards
    func deal3cards()
    {
        for _ in 0..<3
        {
            if let cardToDeal = cardsDealt() // randomly distributes
            {
                cardsInPlay.append(cardToDeal)
                //print("dealing 3 cards) "
            }
        }
    }
    /// creates the deck
    func CreateCards(card: Card, for button: UIButton)
    {
        var symbols = ""
        switch card.symbol
        {
        // triangle
        case .Symbol1: symbols = "▲"
            //print(symbols)
            //circle
        case .Symbol2: symbols = "●"
            //print(symbols)
        //sqaure
        case .Symbol3: symbols = "■"
            //print(symbols)
        }
        var numbers = ""
        switch card.number
        {
        //one symbol
        case .one: numbers = symbols
            //print(numbers)
        // two symbols
        case .two: numbers = String( repeating: symbols, count: 2)
           // print(numbers)
        // three symbols
        case .three: numbers = String( repeating: symbols, count: 3)
            print(numbers)
        }
        var cardColor: UIColor
        switch card.color
        {
        //purple
        case .Color1: cardColor = UIColor.systemPurple
            //print(cardColor)
        //greeen
        case .Color2: cardColor = UIColor.systemGreen
           // print(cardColor)
        //blue
        case .Color3: cardColor = UIColor.systemBlue
            //print(cardColor)
        }
        var alpha: CGFloat = 10.0
        var stroke: CGFloat = -10.0
        switch card.shade
        {
        //filled
        case .Shade1:
            break
        // stripped
        case .Shade2:
            alpha = 0.25
        // outline
        case .Shade3:
            stroke = 8.0
        }
        //// card attributes
        let attributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 30), .foregroundColor: cardColor.withAlphaComponent(alpha), .strokeWidth: stroke]
        let attributedString = NSAttributedString(string: numbers, attributes: attributes)
        button.setAttributedTitle(attributedString, for: UIControl.State.normal)
    }
 
}
