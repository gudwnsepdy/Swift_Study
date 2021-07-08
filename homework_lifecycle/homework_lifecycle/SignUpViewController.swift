//
//  SignUpViewController.swift
//  homework_lifecycle
//
//  Created by 형주 on 2021/07/08.
//

import UIKit
protocol SignUpDelegate : class {
    func didSelectTag(tags: [String])
}
class SignUpViewController: UIViewController {

//    weak var delegate: SignUpDelegate?
    var delegate : SignUpDelegate?
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwcheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancleChange(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SignUpAction(_ sender: Any) {
        if let idText = idTextField.text {
            if let pwText = pwTextField.text {
                if let pwCheckText = pwcheckTextField.text {
                    if pwText == pwCheckText {
                        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
                            nextVC.id = idText
                            nextVC.pw = pwText
//                            self.navigationController?.pushViewController(nextVC, animated: true)
                            let infoList = [idText, pwText]
                            delegate?.didSelectTag(tags: infoList)
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                    else {
                        let alertController = UIAlertController(title: "오류.", message: "비밀번호와 비밀번호 확인이 일치하지 않습니다.", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "돌아가기", style: .cancel, handler: nil))
                        present(alertController, animated: false, completion: nil)
                    }
                }
            }
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


