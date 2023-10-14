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
    
    //1st way to do it
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setUpView()
    }
    
    func setContent(image: String, caption: String?){
        if let caption{
            
        }
    }
    
    private func setUpView(){
//        guard let contentView = Bundle.main.loadNibNamed("CaptionedImage", owner: self)?.first as? UIView else { return }
        
        //3rd manera
        guard let contentView = UINib(nibName: "CaptionedImage", bundle: nil).instantiate(withOwner: self).first as? UIView else { return }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}
