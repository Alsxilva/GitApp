//
//  ViewController.swift
//  Music Bands
//
//  Created by Diplomado on 28/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BandsTableView: UITableView!{
        didSet {
            BandsTableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "BandCell")
        }
    }
    
    let model = BandsTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BandsTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountArray()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model.getSectionTitle()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BandCell") as? MusicTableViewCell
        
        cell?.backgroundColor = .white
        cell?.BandName.text = model.getTitle(index: indexPath)
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print(model.getTitle(index: indexPath))
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 1:
            performSegue(withIdentifier: "Radiohead", sender: nil)
//        case 2:
//            performSegue(withIdentifier: "TableToNextView", sender: nil)
        default:
            break
            }
        
    }
}
