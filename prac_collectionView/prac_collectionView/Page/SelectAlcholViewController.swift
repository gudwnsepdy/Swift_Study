//
//  SelectAlcholViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/09.
//

import UIKit

class SelectAlcholViewController: UIViewController {

    @IBOutlet weak var NonAlcholBaseButton: SelectButton!
    @IBOutlet weak var MiddleAlcholButton: SelectButton!
    @IBOutlet weak var HighAlcholButton: SelectButton!
    @IBOutlet weak var previousButton: PreviousButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        NonAlcholBaseButton.frame.size.height = NonAlcholBaseButton.frame.width
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
       
    }
    
    @IBAction func SelectNonAlcholButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectBaseViewController") as? SelectBaseViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    
    @IBAction func SelectMiddleAlcholButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectBaseViewController") as? SelectBaseViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    @IBAction func SelectHighAlcholButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectBaseViewController") as? SelectBaseViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    @IBAction func PrevButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.frame.size.height = self.layer.frame.width
        }
}

class PreviousButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
//        self.frame.size.width = UIScreen.main.bounds.width * 0.2
//        self.frame.size.height = UIScreen.main.bounds.width * 0.2
        self.backgroundColor = UIColor(red: 199/255, green: 116/255, blue: 104/255, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 15
//
//        self.layer.frame.size.height =
        self.layer.frame.size.width = 200
        }
}
