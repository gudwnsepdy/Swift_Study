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
    @IBOutlet weak var heartImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = photoList[idx]
        bvgName.text = photoNameList[idx]
        bvgCategory.text = bavCategory[idx]
        if heartList[idx] == 1 {
//            heartImage.image = UIImage(systemName: "heart.fill")
            heartImage.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else{
            heartImage.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func ClickHeart(_ sender: Any) {
        if heartList[idx] == 1 {
//            heartImage.image = UIImage(systemName: "heart.fill")
            heartImage.setImage(UIImage(systemName: "heart"), for: .normal)
            heartList[idx] = 0
//            print(heartList)
        }
        else{
            heartImage.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartList[idx] = 1
//            print(heartList)
        }
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
