//
//  ViewController.swift
//  homework_game
//
//  Created by 형주 on 2021/07/18.
//

import UIKit
var imgSet : [UIImage] = [UIImage(named: "left_block")!, UIImage(named: "right_block")!]
var hp = 3
var imgArr : [UIImage] = [imgSet.randomElement()!,
                          imgSet.randomElement()!,
                          imgSet.randomElement()!,
                          imgSet.randomElement()!,
                          imgSet.randomElement()!]

class ViewController: UIViewController {
    
    //MARK: - 변수 선언
    var score : Int = 0
    var mTimer : Timer?
    var number : Int = 0
    var isFever : Bool = false
    
    
    //MARK: - 아울렛 선언
    @IBOutlet weak var imgStack_1 : UIImageView!
    @IBOutlet weak var imgStack_2 : UIImageView!
    @IBOutlet weak var imgStack_3 : UIImageView!
    @IBOutlet weak var imgStack_4 : UIImageView!
    @IBOutlet weak var imgStack_5 : UIImageView!
    @IBOutlet weak var score_label : UILabel!
    @IBOutlet weak var wrong_imageView : UIImageView!
    @IBOutlet weak var heart1 : UIImageView!
    @IBOutlet weak var heart2 : UIImageView!
    @IBOutlet weak var fever_image: UIImageView!
    @IBOutlet weak var feverButton: UIButton!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hp = 3
//        self.navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 255.0, green: 175.0, blue: 177.0, alpha: 1.0)
        self.navigationController?.isToolbarHidden = true
//        self.wrong_imageView.isHidden = true
        self.wrong_imageView.alpha = 0.0
        self.fever_image.isHidden = true
        self.feverButton.isHidden = true
        self.feverButton.isEnabled = false
//        self.game_over.isHidden = true
        img_update()
        self.score_label.text = "\(score)"
        self.navigationController?.isNavigationBarHidden = true
    }

    
    //MARK: - 액션 함수
    @IBAction func touchLeftBtn(_ sender: Any) {
//        print("\(imgArr[4])")
        if "\(imgArr[0])" == "\(UIImage(named: "left_block")!)" {
            
            right()

        }
        else{
            wrong()
            
            
        }
        
    }
    
    @IBAction func touchRightBtn(_ sender: Any) {
        if "\(imgArr[0])" == "\(UIImage(named: "right_block")!)" {
            
            right()
            
        }
        else{
            wrong()
            }
            
        }
    
    @IBAction func feverButtonClick(_ sender: Any) {
        self.feverButton.isHidden = true
        fever()
        self.feverButton.isEnabled = false
    }
    
    //MARK: - Custom 함수
    func right() {
        score += 1
        if score % 60 == 0 {
            self.feverButton.isEnabled = true
            self.feverButton.isHidden = false
        }
        let origin_1 = CGRect(x: self.imgStack_1.frame.minX, y: self.imgStack_1.frame.minY,  width: self.imgStack_1.frame.width, height: self.imgStack_1.frame.height)
        let origin_2 = CGRect(x: self.imgStack_2.frame.minX, y: self.imgStack_2.frame.minY,  width: self.imgStack_2.frame.width, height: self.imgStack_2.frame.height)
        let origin_3 = CGRect(x: self.imgStack_3.frame.minX, y: self.imgStack_3.frame.minY,  width: self.imgStack_3.frame.width, height: self.imgStack_3.frame.height)
        let origin_4 = CGRect(x: self.imgStack_4.frame.minX, y: self.imgStack_4.frame.minY,  width: self.imgStack_4.frame.width, height: self.imgStack_4.frame.height)
        let origin_5 = CGRect(x: self.imgStack_5.frame.minX, y: self.imgStack_5.frame.minY,  width: self.imgStack_5.frame.width, height: self.imgStack_5.frame.height)
                              
        UIView.animate(withDuration: 0.2, animations: {
            self.imgStack_4.frame = CGRect(x: self.imgStack_4.frame.minX , y: self.imgStack_4.frame.minY +  self.imgStack_4.frame.width, width: self.imgStack_4.frame.width, height: self.imgStack_4.frame.height)
            self.imgStack_3.frame = CGRect(x: self.imgStack_3.frame.minX , y: self.imgStack_3.frame.minY +  self.imgStack_3.frame.width, width: self.imgStack_3.frame.width, height: self.imgStack_3.frame.height)
            self.imgStack_2.frame = CGRect(x: self.imgStack_2.frame.minX , y: self.imgStack_2.frame.minY +  self.imgStack_2.frame.width, width: self.imgStack_2.frame.width, height: self.imgStack_2.frame.height)
            self.imgStack_1.frame = CGRect(x: self.imgStack_1.frame.minX , y: self.imgStack_1.frame.minY +  self.imgStack_1.frame.width, width: self.imgStack_1.frame.width, height: self.imgStack_1.frame.height)
            self.imgStack_5.frame = CGRect(x: self.imgStack_5.frame.minX , y: self.imgStack_5.frame.minY +  self.imgStack_5.frame.width, width: self.imgStack_5.frame.width, height: self.imgStack_5.frame.height)

        })
        
        self.score_label.text = "\(self.score)"
        imgArr.remove(at: 0)
        
        if isFever == false{
            imgArr.append(imgSet.randomElement()!)
        } else {
            imgArr.append(UIImage(named: "left_block")!)
        }
        imgStack_4.frame = origin_4
        imgStack_3.frame = origin_3
        imgStack_2.frame = origin_2
        imgStack_1.frame = origin_1
        imgStack_5.frame = origin_5
        img_update()
        
    }
    
    func wrong() {
        self.score_label.text = "\(score)"
//        self.wrong_imageView.isHidden = false
        self.wrong_imageView.alpha = 1.0
        UIView.animate(withDuration: 0.7, animations: {
            self.wrong_imageView.alpha = 0.0
        })
//        usleep(1000)
//        DispatchQueue.global(qos: .userInteractive).async {
//            DispatchQueue.main.sync {
//
//                usleep(400000)
//                self.wrong_imageView.isHidden = true
//            }
//        }
        hp -= 1
        if hp == 2{
            heart1.image = UIImage(systemName: "heart")
            heart1.tintColor = .gray
        }
        if hp == 1{
            heart2.image = UIImage(systemName: "heart")
            heart2.tintColor = .gray
        }
        
        if hp <= 0{
            if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as?
                GameOverViewController {
                nextVC.final_score = score
                                self.navigationController?.pushViewController(nextVC, animated: false)
                
                        }

        }
    }
    
    func img_update() {
        self.imgStack_1.image = imgArr[4]
        self.imgStack_2.image = imgArr[3]
        self.imgStack_3.image = imgArr[2]
        self.imgStack_4.image = imgArr[1]
        self.imgStack_5.image = imgArr[0]
    }
    
    func fever(){
        DispatchQueue.global(qos: .userInteractive).async {
            self.isFever = true
            DispatchQueue.main.sync {
                self.fever_image.isHidden = false
                UIView.animate(withDuration: 2.0, animations: {
                    self.fever_image.alpha = 0.0
                })
//                UIView.animate(withDuration: 1.0, animations: {
//                    self.fever_image.alpha = 0.0
//                })
            }
            
            imgArr = [UIImage(named: "left_block")!,UIImage(named: "left_block")!,UIImage(named: "left_block")!,UIImage(named: "left_block")!,UIImage(named: "left_block")!]
            DispatchQueue.main.sync {
                self.img_update()
            }
            
            sleep(5)
            self.isFever = false
        }
    }
    
    
}

