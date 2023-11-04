//
//  ViewController.swift
//  CollectionTableView
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class ViewController: UIViewController/*, UITableViewDelegate*/ {
    
        var dataArray = ["Primero", "Segundo", "Tercero"]
        var filterArray: [String] = []


    @IBOutlet weak var SortButton: UIBarButtonItem!
    @IBOutlet weak var FirstTableViewOutler: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBAction func SortButtonAction(_ sender: Any) {
        if  FirstTableViewOutler.isEditing {
            FirstTableViewOutler.isEditing = false
        } else {
            FirstTableViewOutler.isEditing = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        FirstTableViewOutler.delegate = self
        filterArray = dataArray
        
        SearchBar.delegate = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = filterArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        filterArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filterArray = []
        
        if searchText == "" {
            filterArray = dataArray
        }
        
        for word in dataArray {
            if word.uppercased().contains(searchText.uppercased()){
                filterArray.append(word)
            }
        }
        FirstTableViewOutler.reloadData()
    }
}
