//
//  ViewController.swift
//  RGB Colors
//
//  Created by Diplomado on 30/09/23.
//

import UIKit


class ViewController: UIViewController {

    var red: CGFloat = 0.33
    var green: CGFloat = 0.33
    var blue: CGFloat = 0.33
    var alpha: CGFloat = 0.33
    
    @IBOutlet var screenBack: UIView!
    @IBOutlet weak var blueShift: UISlider!
    @IBOutlet weak var redShift: UISlider!
    @IBOutlet weak var greenShift: UISlider!
    @IBOutlet weak var alphaShift: UISlider!
    
    @IBAction func blueModified(_ sender: UISlider) {
        screenBack.backgroundColor!.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        screenBack.backgroundColor = UIColor(red: red, green: green, blue: CGFloat(sender.value), alpha: alpha)
        print("Blue Changed")
        print(screenBack.backgroundColor!)
    }
    
    @IBAction func redModified(_ sender: UISlider) {
        screenBack.backgroundColor!.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        screenBack.backgroundColor = UIColor(red: CGFloat(sender.value), green: green, blue: blue, alpha: alpha)
        print("Red Changed")
        print(screenBack.backgroundColor!)
    }
    
    @IBAction func greenModified(_ sender: UISlider) {
        screenBack.backgroundColor!.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        screenBack.backgroundColor = UIColor(red: red, green: CGFloat(sender.value), blue: blue, alpha: alpha)
        print("Green Changed")
        print(screenBack.backgroundColor!)
    }
    
    @IBAction func alphaModified(_ sender: UISlider) {
        screenBack.backgroundColor!.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        screenBack.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: CGFloat(sender.value))
        print("Alpha Changed")
        print(screenBack.backgroundColor!)
    }
}

