//
//  ViewController.swift
//  Alert
//
//  Created by 형주 on 2021/06/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func touchUpShowAlertButton(_ sender: UIButton) {
        self.showAlertcontroller(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        self.showAlertcontroller(style: UIAlertController.Style.actionSheet)
    }
    
    
    
    func showAlertcontroller(style: UIAlertController.Style) {
        let alertcontroller: UIAlertController
        alertcontroller = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in print("OK pressed")
        })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertcontroller.addAction(okAction)
        alertcontroller.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.default, handler: handler)
        
        alertcontroller.addAction(someAction)
        alertcontroller.addAction(anotherAction)
        
        alertcontroller.addTextField { (field: UITextField) in
            field.placeholder = "플레이스 홀더"
            field.textColor = UIColor.red
        }
        
        self.present(alertcontroller, animated: true, completion: {
            print("Alert controller shown")
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

