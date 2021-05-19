//
//  GymViewController.swift
//  Scatter
//
//  Created by 형주 on 2021/05/19.
//

import UIKit
import WebKit

class GymViewController: UIViewController {

    @IBOutlet weak var myGymWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadWebpage(url: "https://test.sungjun.site/gym")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func loadWebpage(url:String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myGymWebView.load(myRequest)
    }

}
