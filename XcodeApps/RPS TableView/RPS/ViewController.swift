//
//  ViewController.swift
//  RPS
//
//  Created by Diplomado on 21/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonPlay.isEnabled = false
    }
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var scoreButtonPressed: UIButton!
    @IBOutlet weak var matchesButtonPressed: UIButton!
    
    //Game mode settings

    @IBOutlet weak var winValueField: UITextField!
    @IBAction func loseValueField(_ sender: UITextField) {
    }
    @IBOutlet weak var toWinValueField: UITextField!
    
    
    //Hide and show game info fields (unfinished)
    
    @IBOutlet weak var stackSliderWidth: NSLayoutConstraint!
    @IBOutlet weak var stackInputsWidth: NSLayoutConstraint!
    
    
    @IBAction func userFilledName(_ sender: UITextField) {
        buttonPlay.isEnabled = true
        if (sender.text == ""){ buttonPlay.isEnabled = false
        }
    }
    
    @IBAction func scoreButtonPressed(_ sender: UIButton) {
        self.stackSliderWidth.constant = 50
        self.stackInputsWidth.constant = 50
    }
    
    @IBAction func matchesButtonPressed(_ sender: UIButton) {
        self.stackSliderWidth.constant = 50
        self.stackInputsWidth.constant = 50
    }
}
