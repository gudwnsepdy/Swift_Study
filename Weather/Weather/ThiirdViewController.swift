//
//  ThiirdViewController.swift
//  Weather
//
//  Created by 형주 on 2021/06/01.
//

import UIKit

class ThiirdViewController: UIViewController {

    var imageName: String?
    var statusName: String?
    var tempStatus: String?
    var percentName: String?
    @IBOutlet weak var iamge: UIImageView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var percent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        iamge.image = UIImage(named: imageName!)
        status.text = statusName!
        temp.text = tempStatus!
        percent.text = percentName!
        
        
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
