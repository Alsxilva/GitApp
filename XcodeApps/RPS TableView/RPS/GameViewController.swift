//
//  GameViewController.swift
//  RPS
//
//  Created by Diplomado on 21/10/23.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var computerChoice: UILabel!
    @IBOutlet weak var resultPrint: UILabel!
    
    enum Choice: String{
        case rock = "Rock"
        case paper = "Paper"
        case scissor = "Scissor"
    }
    
    enum Winner: String{
        case user = "You won"
        case computer = "CPU won"
        case tie = "Tie"
    }
    
    let choicess:[Choice] = [.rock, .paper, .scissor]
    
    @IBAction func userChpice(_ sender: UIButton) {
        let userChoice = sender.tag
        switch userChoice{
        case 1:
            resultPrint.text = whosTheWinner(user: .rock, computer: computerChoiced()).rawValue
            break
        case 2:
            resultPrint.text = whosTheWinner(user: .paper, computer: computerChoiced()).rawValue
            break
        case 3:
            resultPrint.text = whosTheWinner(user: .scissor, computer: computerChoiced()).rawValue
            break
        default:
            print("Pick one right")
        }
    }
    
    func computerChoiced() -> Choice{
        return choicess.randomElement()!
    }
    
    func whosTheWinner(user: Choice, computer: Choice) -> Winner{
        
        computerChoice.text = computer.rawValue
        
        switch user{
        case .rock:
            if computer == .scissor {
                return .user
            } else if computer == .paper{
                return .computer
            } else {
                return .tie
            }
        case .paper:
            if computer == .rock {
                return .user
            } else if computer == .scissor{
                return .computer
            } else {
                return .tie
            }
        case .scissor:
            if computer == .paper {
                return .user
            } else if computer == .rock{
                return .computer
            } else {
                return .tie
            }
        }
    }
}
