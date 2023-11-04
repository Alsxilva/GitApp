//
//  CollectionViewController.swift
//  CollectionTableView
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var textFieldColl: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    @IBAction func addActionButton(_ sender: Any) {
        dataArray.append(textFieldColl.text ?? "")
        textFieldColl.text = ""
        collectionView.reloadData()
    }
    
    let size = UIScreen.main.bounds.width / 2
    
    var dataArray = ["Manuel", "Jose", "Jimena", "Chabelo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

     
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        
        collectionView.addGestureRecognizer(longPressGesture)
        
    }
    @objc private func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer){
        let gestureLocation = gesture.location(in: collectionView)
    
        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gestureLocation) else {return}; collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
                    case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gestureLocation)
        case .ended:
            collectionView.endInteractiveMovement()
                        
        default: collectionView.cancelInteractiveMovement()
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as? CustomCollectionViewCell
        cell?.myTextLabel.text = dataArray[indexPath.row]
        return cell!
    }
    
}


extension CollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(item, at: destinationIndexPath.row)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
          return  CGSize(width: size, height: size)
        }else  {
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
}
