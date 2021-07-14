//
//  ViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imageArray = [UIImage(named: "1"),UIImage(named: "1"),UIImage(named: "1"),UIImage(named: "1"),UIImage(named: "1"),UIImage(named: "1"),UIImage(named: "1")]
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.imgImage.image = imageArray[indexPath.row]

        cell.view.layer.borderColor = UIColor.gray.cgColor
        cell.view.layer.borderWidth = 0.1
        cell.view.layer.cornerRadius = 20
        cell.view.layer.shadowColor = UIColor.gray.cgColor
        cell.view.layer.shadowOpacity = 1.0
        cell.view.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        cell.view.layer.shadowRadius = 2
        

        cell.cockName.text = "모히또"
        cell.cockDegree.text = "Alc 12.6"
        return cell
    }
    
    @IBAction func gohome(_ sender: Any) {
        navigationController?.pushViewController(HomeViewController(nibName: "HomeViewController", bundle: nil), animated: true)
//
//        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
//                            self.navigationController?.pushViewController(nextVC, animated: true)
//                    }
    }
    
    
}

