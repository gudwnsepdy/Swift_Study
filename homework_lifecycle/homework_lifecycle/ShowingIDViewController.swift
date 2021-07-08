//
//  ShowingIDViewController.swift
//  homework_lifecycle
//
//  Created by 형주 on 2021/07/08.
//

import UIKit

class ShowingIDViewController: UIViewController {
    var idText: String = "ID"
    
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        idLabel.text = idText
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
