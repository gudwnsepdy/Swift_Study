//
//  ViewController.swift
//  xib_prac1
//
//  Created by 형주 on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var arr : [String] = ["hi", "bye"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "zeddCell")
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zeddCell",for: indexPath) as! MyTableViewCell
        
        cell.myLabel.text = arr[indexPath.row]
        cell.myImageView.image = UIImage(named: "zedd")
        return cell
    }
}
