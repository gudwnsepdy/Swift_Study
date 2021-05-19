//
//  MainViewController.swift
//  Scatter
//
//  Created by 형주 on 2021/05/19.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var mapButton: UIButton! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        mainImage.image = UIImage(#imageLiteral(resourceName: "background.png"))
        self.navigationController?.isNavigationBarHidden = true
     
    }

   
    
}
