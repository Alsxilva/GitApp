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
            firstCaptionedImage.setContent(image: "okeey", caption: "okeey 1")
            secondCaptionedImage.setContent(image: "okeey", caption: "okeey 2")
            thirdCaptionedImage.setContent(image: "okeey", caption: "okeey 3")
        } else{
            firstCaptionedImage.image.image = UIImage(named: "Rafa Separator-10")
            secondCaptionedImage.image.image = UIImage(named: "Rafa Separator-10")
            thirdCaptionedImage.image.image = UIImage(named: "Rafa Separator-10")
        }
        
    }
   
    
}
