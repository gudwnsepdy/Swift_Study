//
//  SecondViewController.swift
//  projectB
//
//  Created by 형주 on 2021/05/25.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController =  UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwtextField: UITextField!
    @IBOutlet weak var checktextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var YellowtextView: UITextField!
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
//        var imageView =  imageView
        imageView.image = UIImage(named: "Image.jpg")
        imageView.isUserInteractionEnabled = true
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.buttonTapped)))


        
    }
        
   @objc func buttonTapped(sender: UITapGestureRecognizer) {
    
        self.present(self.imagePicker, animated: true, completion: nil)
    }


    @IBAction func dismissButton (_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pwCheck(_ sender: UITextField) {
        if sender.tag == 1 {
            if (sender.text == checktextField.text) && !(YellowtextView.text!.isEmpty){
                nextButton.isEnabled = true
            }else {
                nextButton.isEnabled = false
            }
        } else if sender.tag == 2{
            if (sender.text == pwtextField.text) && !(YellowtextView.text!.isEmpty) {
                nextButton.isEnabled = true
            } else {
                nextButton.isEnabled = false
            }
        } else if sender.tag == 3 {
            if (checktextField.text == pwtextField.text) && !(YellowtextView.text!.isEmpty) {
                nextButton.isEnabled = true
            } else {
                nextButton.isEnabled = false
            }
        }
    }
    
    
    func touchToPickPhoto() {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        print("\(sender.view!.tag) 클릭됨")
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
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
