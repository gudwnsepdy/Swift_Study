//
//  ShowingIDViewController.swift
//  homework_lifecycle
//
//  Created by 형주 on 2021/07/08.
//

import UIKit

class ShowingIDViewController: UIViewController {
    var idText: String = "ID"
    var pwText: String = ""
    var mainVC : ViewController?
    
    
    @IBOutlet weak var idLabel: UILabel!
//    @IBOutlet weak var backBtn: uibackbutton!
    func onVCAction(data: String)
    {
        self.idText = data
        self.idLabel.text = data
    }
    
    func onVCAction2(data: String)
    {
        self.pwText = data
        
    }
    @IBAction func changeInfo(_ sender: Any) {
        
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeInfoViewController") as? ChangeInfoViewController {
            nextVC.previousID = idText
            nextVC.previousVC = self
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        }
//            self.navigationController?.pushViewController(nextVc!, animated: true)
        
    }
    
    @IBAction func backButton(_sender: UIBarButtonItem){
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            nextVC.id = idText
            nextVC.pw = pwText
//                            self.navigationController?.pushViewController(nextVC, animated: true)
            mainVC?.onSignUpVCAction(data: idText)
            mainVC?.onSignUpVCAction2(data: pwText)
            self.navigationController?.popViewController(animated: true)
//                            let infoList = [idText, pwText]
//                            delegate?.didSelectTag(tags: infoList)
            
//                            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            nextVC.id = idText
            nextVC.pw = pwText
//                            self.navigationController?.pushViewController(nextVC, animated: true)
            mainVC?.onSignUpVCAction(data: idText)
            mainVC?.onSignUpVCAction2(data: pwText)
//            self.navigationController?.popViewController(animated: true)
//                            let infoList = [idText, pwText]
//                            delegate?.didSelectTag(tags: infoList)
            
//                            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        idLabel.text = idText + "님"
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
