//
//  DetailViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/14.
//

import UIKit

class DetailViewController: UIViewController {
    var idx: Int = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bvgName: UILabel!
    @IBOutlet weak var bvgCategory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = photoList[idx]
        bvgName.text = photoNameList[idx]
        bvgCategory.text = bavCategory[idx]
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
