//
//  ViewController.swift
//  SetGameFinal
//
//  Created by Brandon Johns on 9/28/20.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var cardButton: [UIButton]!
    @IBOutlet weak var deal3CardsButton: UIButton!
    @IBOutlet weak var newGame: UIButton!
    private(set) var score = 0
    var card = [Card]()
    lazy var game = SetGame()
    @IBOutlet weak var matchesLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        for button in cardButton
        {
            button.layer.cornerRadius = 8.0
        }
        /// to many cards turn off button
        deal3CardsButton.setTitleColor(UIColor.gray, for: .disabled)
        updateViewFromModel()
    }
    // user touches card
    @IBAction func touchCard(_ sender: UIButton)
    {
        let index = cardButton.firstIndex(of: sender)!
        let card = game.cardsInPlay[index]
        //print("card picked")
        game.chooseCard(card: card)
        updateViewFromModel()
    }
    //restart
    @IBAction func restartGame(_ sender: UIButton)
    {
        //print("newgame")
        game = SetGame()
        updateViewFromModel()
        score = 0
    }
    //deal3
    @IBAction func deal3Cards(_ sender: UIButton)
    {
        game.deal3cards()
        updateViewFromModel()
    }
    // resets buttons
    private func resetButtons()
    {
        for select in cardButton
        {
            select.isEnabled = false
            select.setAttributedTitle(NSAttributedString(string: ""), for: UIControl.State.normal)
            select.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            select.layer.borderWidth = 0.0
        }
        // print("buttons cleared")
    }
    //updatescreen
    func updateViewFromModel()
    {
        resetButtons()
        for index in 0..<game.cardsInPlay.count
        {
            let button = cardButton[index]
            button.isEnabled = true
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            let card = game.cardsInPlay[index]
            game.CreateCards(card: card, for: button)
            if game.selectedCards.contains(card)
            {
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.blue.cgColor
                button.layer.cornerRadius = 15.0
            }
            else
            {
                button.layer.borderWidth = 0.0
            }
        }
        score = game.score
        if (game.cardsInPlay.count + 3 <= cardButton.count)
        {
            deal3CardsButton.isEnabled = true
        }
        else
        {
            deal3CardsButton.isEnabled = false
        }
        scoreLabel.text = "Score: \(game.score)"
        matchesLabel.text = "Matches: \(game.matchedCards) "
    }
}

