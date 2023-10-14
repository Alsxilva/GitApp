//
//  ShareViewController.swift
//  MyAppp
//
//  Created by Diplomado on 13/10/23.
//

import UIKit

class ShareViewController: UIViewController {

    private lazy var textView: UITextView = {
        let textView = UITextView()
        
        //SIEMPRE PARA DESACTIVAR LOS CONTRAINTS AUTOMÁTICOS
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        return textView
    }()
    
    private lazy var shareButton: UIButton = {
        let action = UIAction(title: "Share"){ [weak self] _ in
            self?.shareButtonTapped()
        }
        let button = UIButton(primaryAction: action)
        //let button = UIButton()
        //button.addTarget(self, action: #selector(shareButtonTapped), for: touchUpInside)
        //button.setTitle("Share", for: .normal)
        return button
    }
    
    @objc func shareButtonTapped(){
        print(textView.text ?? "")
    }
    
    private func setElements(){
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            textView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        ])
    }
}

extension ShareViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool { if text == "" { return true }
        return ((textView.text?.count ?? 0) - range.length + text.count) < 150
    }
    
}
