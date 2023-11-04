//
//  ViewController.swift
//  CollectionTableView
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var dataArray = ["Primero", "Segundo", "Tercero"]
    var filterArray: [String] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterArray = dataArray
        tableView.dataSource = self
        searchBar.delegate = self
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
        
        //En vez de reload data
        filterArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
}

extension ViewController: UISearchBarDelegate{
    
    //Hace algo cada vez que interactuemos
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filterArray = []
        
        
        if searchText == "" {
            filterArray = dataArray
        }
        
        for word in dataArray {
            //Pasa array a mayusculas. Se podría mandar todo a minúsculas
            if word.uppercased().contains(searchText.uppercased()){
                filterArray.append(word)
            }
        }
        tableView.reloadData()
    }
}
