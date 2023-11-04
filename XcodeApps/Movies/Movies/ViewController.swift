//
//  ViewController.swift
//  Movies
//
//  Created by Diplomado on 04/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var dataArray1 = ["Interstellar","Fight Club", "Avatar", "Inception"]
    var dataArray2 = ["It","Donnie Darko", "Matrix", "The Truman Show"]
    var dataArray3 = ["Project X","Fear and Loathing in las Vegas"]
    
    let size = UIScreen.main.bounds.width / 2
    
    @IBOutlet weak var movieCollection3: UICollectionView!{
        didSet{
            movieCollection3.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    
    @IBOutlet weak var movieCollection2: UICollectionView!{
        didSet{
            movieCollection2.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var movieCollectionView: UICollectionView!{
        didSet{
            movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollection2.dataSource = self
        movieCollection2.delegate = self
        movieCollection3.dataSource = self
        movieCollection3.delegate = self
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {4}
        else if collectionView.tag == 3 {2}
        else {3}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as? MovieCollectionViewCell
        if collectionView.tag == 1{
            cell?.movieLabel.text = dataArray1[indexPath.row]
        }else if collectionView.tag == 2{
            cell?.movieLabel.text = dataArray2[indexPath.row]
        }else {
            cell?.movieLabel.text = dataArray3[indexPath.row]
        }
        return cell!
    }
        
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
          return  CGSize(width: size, height: size)
        }else  {
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
}
