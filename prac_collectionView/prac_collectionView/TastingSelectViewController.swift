//
//  TastingSelectViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/04.
//

import UIKit

class TastingSelectViewController: UIViewController {

    @IBOutlet weak var nullBaseButton: SelectButton!
    @IBOutlet weak var VodkaBaseButton: SelectButton!
    @IBOutlet weak var GinBaseButton: SelectButton!
    @IBOutlet weak var RumBaseButton: SelectButton!
    @IBOutlet weak var WiskyBaseButton: SelectButton!
    @IBOutlet weak var TequilaBaseButton: SelectButton!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var sweetSlider: TasteSlider!
    @IBOutlet weak var sourSlider: TasteSlider!
    @IBOutlet weak var bitterSlider: TasteSlider!
    @IBOutlet weak var drySlider: TasteSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let len = UIScreen.main.bounds.width * 0.9
        stackView.frame.size.width = len
        stackView.spacing = 10
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

class SelectButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
//        self.frame.size.width = UIScreen.main.bounds.width * 0.2
//        self.frame.size.height = UIScreen.main.bounds.width * 0.2
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.black, for: .normal)
        self.layer.cornerRadius = 7
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        }
}

class TasteSlider: UISlider {
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        self.tintColor = UIColor(red: 199.0/255.0, green: 116.0/255.0, blue: 104.0/255.0, alpha: 1.0)
        }
    
}
