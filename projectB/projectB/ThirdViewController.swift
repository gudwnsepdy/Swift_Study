//
//  ThirdViewController.swift
//  projectB
//
//  Created by 형주 on 2021/05/25.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBAction func notEmpty(_ sender: Any) {
        if !phone.text!.isEmpty {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
    }
    
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value changed")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dateformat.string(from: date)
        
        self.dateLabel.text = dateString
        
    }
    
    @IBAction func dismissButton (_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    let dateformat: DateFormatter = {
        let format: DateFormatter = DateFormatter()
        format.dateStyle = .long
        format.timeStyle = .none
        format.locale = Locale(identifier: "ko_KR")
        return format
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let date: Date = Date()
        let dateString = dateformat.string(from: date)
        dateLabel.text = dateString
    }

    @IBAction func singUp (_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancle (_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
