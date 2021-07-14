//
//  SelectBaseViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/09.
//

import UIKit

class SelectBaseViewController: UIViewController {
    
    @IBOutlet weak var nullBaseButton: SelectButton!
    @IBOutlet weak var VodkaBaseButton: SelectButton!
    @IBOutlet weak var GinBaseButton: SelectButton!
    @IBOutlet weak var RumBaseButton: SelectButton!
    @IBOutlet weak var WiskyBaseButton: SelectButton!
    @IBOutlet weak var TequilaBaseButton: SelectButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func SelectNullButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectSweetViewController") as? SelectSweetViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    
    @IBAction func SelectVodkaButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectSweetViewController") as? SelectSweetViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    
    
    @IBAction func SelectGinButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectSweetViewController") as? SelectSweetViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    
    
    @IBAction func SelectRumButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectSweetViewController") as? SelectSweetViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    
    
    @IBAction func SelectWiskyButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectSweetViewController") as? SelectSweetViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    
    
    @IBAction func SelectTequilaButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectSweetViewController") as? SelectSweetViewController {
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
