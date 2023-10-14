//
//  ImageStackViewController.swift
//  MyAppp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {
    
    var showPort = false
    
    //Contenedor
    @IBOutlet weak var firstCaptionedImage: CaptionedImage!
    @IBOutlet weak var secondCaptionedImage: CaptionedImage!
    @IBOutlet weak var thirdCaptionedImage: CaptionedImage!
    
    //Imagen
    override func viewDidLoad() {
        super.viewDidLoad()
        if showPort{
            firstCaptionedImage.image.image = UIImage(named: "okeeey")
            firstCaptionedImage.captionLabel.text = "cat-1"
            secondCaptionedImage.image.image = UIImage(named: "okeeey")
            secondCaptionedImage.captionLabel.text = "cat-2"
            thirdCaptionedImage.image.image = UIImage(named: "okeeey")
            thirdCaptionedImage.captionLabel.text = "cat-3"
        } else{
            firstCaptionedImage.image.image = UIImage(named: "Rafa Separator-10")
            secondCaptionedImage.image.image = UIImage(named: "Rafa Separator-10")
            thirdCaptionedImage.image.image = UIImage(named: "Rafa Separator-10")
        }
        
    }
   
    
}
