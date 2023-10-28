//
//  ViewController.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    let model = TableViewModel()
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addButton(_ sender: UIButton) {
        model.addRow(text: textField.text ?? "")
        TableView.reloadData()
    }
    
    @IBOutlet weak var TableView: UITableView!{
        didSet {
            TableView.register(UINib(nibName: "My2ndTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //TableView.dataSource = self
        TableView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountArray()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model.getSectionTitle()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsSection section: Int) -> Int? {
        switch section{
        case 0: model.getCountArray()
        case 1: 1
        default: 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? My2ndTableViewCell
        
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//            cell?.backgroundColor = .gray
//            cell?.accessoryType = .disclosureIndicator
//        }
//        
//        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//        cell?.textLabel?.text = model.getTitle(index: indexPath)
//        cell?.detailTextLabel?.text = model.getDescription(index: indexPath)
        
//        cell?.MyTitle.text = model.getTitle(index: indexPath)
//        cell?.MySubtitle.text = model.getDescription(index: indexPath)
        
        switch indexPath.section {
        case 1: cell?.backgroundColor = .blue
        case 2: cell?.backgroundColor = .brown
        default: cell?.backgroundColor = .white
        }
        
        cell?.MyTitle.text = model.getTitle(index: indexPath)
        cell?.MySubtitle.text = model.getDescription(index: indexPath)
        
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        150.0
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 1: 50
        case 2: 50
        default: 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(model.getTitle(index: indexPath))
        
        //performSegue(withIdentifier: "TableToNextView", sender: nil)
        
        //tableView.allowsSelection = false
        //tableView.isEditing = false
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
        
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let alert = UIAlertController(title: "Cart!", message: "Are you sure want to remove this item from list?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "YES", style:
                UIAlertAction.Style.default) {
                   UIAlertAction in
                   print("Yes")
                self.model.deleteRow(index: indexPath)
                tableView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "CANCEL", style:
                UIAlertAction.Style.cancel) {
                   UIAlertAction in
                   print("Cancel")
                }
            self.present(alert, animated: true, completion: nil)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
        }
//        }else if editingStyle == .insert{
//            model.addRow(text: textField.text ?? "")
//            tableView.reloadData()
//        }
    }
    
}
