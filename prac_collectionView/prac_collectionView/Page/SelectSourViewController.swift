//
//  SelectSourViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/09.
//

import UIKit

class SelectSourViewController: UIViewController {
    @IBOutlet weak var SourLowButton: SelectButton!
    @IBOutlet weak var SourMiddleButton: SelectButton!
    @IBOutlet weak var SourHighButton: SelectButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func SelectSourLowButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectBitterViewController") as? SelectBitterViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    
    @IBAction func SelectSourMiddleButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectBitterViewController") as? SelectBitterViewController {
                            self.navigationController?.pushViewController(nextVC, animated: true)
                    }
    }
    @IBAction func SelectSourHighButton(_ sender: Any) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectBitterViewController") as? SelectBitterViewController {
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
