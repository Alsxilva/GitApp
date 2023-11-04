//
//  FirstViewController.swift
//  TabBarController
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "Primero"
        self.tabBarItem.image = UIImage(systemName: "eraser")
        self.tabBarItem.selectedImage = UIImage(systemName: "eraser.fill")
        

    }
}
