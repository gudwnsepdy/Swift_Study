//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 형주 on 2021/05/30.
//

import UIKit

class SecondViewController: UIViewController {

    
    var textToSet: String?
    
    @IBOutlet weak var textLable: UILabel!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.textLable.text = self.textToSet
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
