//
//  ViewController.swift
//  HomeCopy
//
//  Created by 형주 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }


}

