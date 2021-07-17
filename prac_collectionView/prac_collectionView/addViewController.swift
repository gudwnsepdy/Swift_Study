//
//  addViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/14.
//

import UIKit

class addViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController =  UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = originalImage
//            photoList.append(originalImage)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func addAction(_ sender: Any) {
//        baverageList.append(tf.text!)
        photoNameList.append(tf.text!)
        bavCategory.append(categoryTF.text!)
        photoList.append(imageView.image!)
        heartList.append(0)
        self.navigationController?.popViewController(animated: true)
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
class RoundButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
//        self.frame.size.width = UIScreen.main.bounds.width * 0.2
//        self.frame.size.height = UIScreen.main.bounds.width * 0.2
        self.backgroundColor = UIColor(red: 199/255, green: 116/255, blue: 104/255, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.frame.size.height = self.layer.frame.width
        }
}
