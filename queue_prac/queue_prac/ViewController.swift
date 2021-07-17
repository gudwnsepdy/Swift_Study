//
//  ViewController.swift
//  queue_prac
//
//  Created by 형주 on 2021/07/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    var ColorList: [UIColor] = [.purple, .cyan, .blue, .orange, .gray]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DispatchQueue.global(qos: .userInitiated).async {
            
                for i in self.ColorList {
                    DispatchQueue.main.async {
                    self.view1.backgroundColor = i
                 
                }
                    usleep(1000000)
            }
            
        }
        DispatchQueue.global(qos: .userInitiated).async {
            
                for i in self.ColorList.reversed() {
                    DispatchQueue.main.async {
                    self.view2.backgroundColor = i
                    usleep(1000000)
                }
            }
            
        }
        
    }


}

