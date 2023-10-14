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
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    //Imagen
    override func viewDidLoad() {
        super.viewDidLoad()
        if showPort{
            firstImageView.image = UIImage(named: "okeeey")
            secondImageView.image = UIImage(named: "okeeey")
            thirdImageView.image = UIImage(named: "okeeey")
        } else{
            firstImageView.image = UIImage(named: "Rafa Separator-10")
            secondImageView.image = UIImage(named: "Rafa Separator-10")
            thirdImageView.image = UIImage(named: "Rafa Separator-10")
        }
        
    }
   
    
}
