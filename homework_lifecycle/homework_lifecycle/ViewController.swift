//
//  ViewController.swift
//  homework_lifecycle
//
//  Created by 형주 on 2021/07/08.
//

import UIKit

class ViewController: UIViewController {

    var id: String = "initID"
    var pw: String = "initPW"
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print(id)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        idTextField.text = ""
        pwTextField.text = ""
    }
    
    func onSignUpVCAction(data: String)
    {
        self.id = data
    }
    
    func onSignUpVCAction2(data: String)
    {
        self.pw = data
    }
    @IBAction func signInAction(_ sender: Any) {
        if idTextField.text == id && pwTextField.text == pw {
//            let vcName = self.storyboard?.instantiateViewController(identifier: "ShowingIDViewController")
            
//            self.present(vcName!, animated: true, completion: nil)
//            vcName.id = idTextField.text
//            vcName.
            if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowingIDViewController") as? ShowingIDViewController {
                if let passingData = idTextField.text {
                    nextVC.mainVC = self
                    nextVC.idText = passingData
                    nextVC.pwText = pwTextField.text!
//                    nextVC.mainVC = self
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
//            self.navigationController?.pushViewController(nextVc!, animated: true)
            
        }
        else{
            let alertController = UIAlertController(title: "아이디나 비밀번호가 틀립니다.", message: "아이디나 비밀번호를 확인해주세요", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "돌아가기", style: .cancel, handler: nil))
            present(alertController, animated: false, completion: nil)
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
      
            if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
                    nextVC.mainVC = self
//                    nextVC.mainVC = self
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
//            self.navigationController?.pushViewController(nextVc!, animated: true)
            
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//        guard let nextViewController: ShowingIDViewController = segue.destination as? ShowingIDViewController else {
//            return
//        }
//
//        if let idStr = idTextField.text {
//            nextViewController.idText = idStr
//        }
//
//
//
//    }
//
}


