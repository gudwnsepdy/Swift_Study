//
//  AddViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/14.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var tfAdditem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addButton(_ sender: UIButton){
        baverageList.append(tfAdditem.text!)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
