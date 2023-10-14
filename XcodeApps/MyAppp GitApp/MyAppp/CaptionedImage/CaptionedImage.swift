//
//  CaptionedImage.swift
//  MyAppp
//
//  Created by Diplomado on 13/10/23.
//

import UIKit

class CaptionedImage: UIView {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    //2nd way to do it
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setUpView()
    }
    private func setUpView(){
        Bundle.main.loadNibNamed("CaptionedImage", owner: self)
        addSubview(contentView)
        
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}
