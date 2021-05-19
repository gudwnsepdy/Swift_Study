//
//  ViewController.swift
//  Scatter
//
//  Created by 형주 on 2021/05/19.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        loadWebpage(url: "https://test.sungjun.site/")
    }

    @IBAction func btnCall(_ sender: UIButton) {
    }
    
    //웹페이지 띄우는 함수
    func loadWebpage(url:String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
}

