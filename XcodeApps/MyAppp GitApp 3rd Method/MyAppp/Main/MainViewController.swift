//
//  ViewController.swift
//  MyAppp
//
//  Created by Diplomado on 22/09/23.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print ("1")
//        // Do any additional setup after loading the view.
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("2")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("3")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("4")
//    }
    
    @IBOutlet weak var photoTypeSwitch: UISwitch!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!{
        didSet{
            titleTextField.delegate = self
        }
    }    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? ImageStackViewController else {return}
        destinationViewController.showPort = photoTypeSwitch.isOn
        destinationViewController.title = titleTextField.text
    }

    @IBAction func photoTypeSwitchValueChanged(_ sender: UISwitch) {
        sender.isOn ? nextButton.setTitle("Ports 1", for: .normal) : nextButton.setTitle("Ports 2", for: .normal)
    }
    
    @IBAction func titleTextFieldEditingChanged(_ sender: UITextField) {
        titleLabel.text = sender.text
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        print(photoTypeSwitch.isOn)
    }
}

//Código del Delegado
//La función Text Field nos permite dar las características del Texto Ingresado y por cambiar.
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //Valua caracter alphanumericos
        //"" es el código de borrado
        //Validamos si es alphanumérico
        if string == "" { return true }
    
        //Si es alphanumérico y se intersa espacio, se cuenta la cantidad de caracteres que limitaremos. Se limita con un rango.
        if string.rangeOfCharacter(from: .alphanumerics) == nil && string != " " {
            return false
        } else { return (textField.text?.count ?? 0) + string.count - range.length <= 10
        }
    }
}
