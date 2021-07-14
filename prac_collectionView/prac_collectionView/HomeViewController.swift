//
//  HomeViewController.swift
//  Koktail
//
//  Created by 최승명 on 2021/06/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    var imageArray = [UIImage(named: "1"), UIImage(named: "1"),
                      UIImage(named: "1"), UIImage(named: "1"),
                      UIImage(named: "1"), UIImage(named: "1"),
                      UIImage(named: "1")]
    
    @IBOutlet weak var recommendBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "홈화면"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor =
            UIColor(red: 199.0/255.0, green: 116.0/255.0, blue: 104.0/255.0, alpha: 0.0)
//        self.navigationController?.navigationBar.barTintColor = UIColor.black
        collectionView.delegate = self
        collectionView.dataSource = self
        let nibName = UINib(nibName: "CocktailCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "cocktailCell")
//        recommendBtn.layer.borderColor = UIColor.black.cgColor
//        recommendBtn.layer.borderWidth = 1
        
        recommendBtn.backgroundColor = UIColor.white
        recommendBtn.layer.cornerRadius = 20
        recommendBtn.layer.shadowColor = UIColor.gray.cgColor
        recommendBtn.layer.shadowOpacity = 1.0
        recommendBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        recommendBtn.layer.shadowRadius = 1.5
        
    }
    
    @IBAction func RecommendAction(_ sender: UIButton){
//        self.navigationController?.pushViewController(SelectAlcholViewController, animated: true)
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectAlcholViewController") as? SelectAlcholViewController {
                                    self.navigationController?.pushViewController(nextVC, animated: true)
                            }
//                                    self.navigationController?.pushViewController(nextVC, animated: true)
//        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectAlcholViewController") as? SelectAlcholViewController {
//                            self.navigationController?.pushViewController(nextVC, animated: true)
//                    }
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cocktailCell", for: indexPath)
            as! CocktailCollectionViewCell
        print("HI")
        cell.cocktailImg.image = imageArray[indexPath.row]
//        cell.cocktailImg.layer.borderWidth = 1
//        cell.cocktailImg.layer.borderColor = UIColor.gray.cgColor
        cell.cocktailImg.layer.cornerRadius = 20
        cell.view.layer.borderColor = UIColor.gray.cgColor
        cell.view.layer.borderWidth = 0.1
        cell.view.layer.cornerRadius = 20
        cell.view.layer.shadowColor = UIColor.gray.cgColor
        cell.view.layer.shadowOpacity = 1.0
        cell.view.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        cell.view.layer.shadowRadius = 2
        cell.cocktailName.text = "모히또"
        cell.cocktailDegree.text = "Alc 12.6"
        return cell
    }
}
