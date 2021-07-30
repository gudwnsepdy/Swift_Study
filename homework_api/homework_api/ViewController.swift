//
//  ViewController.swift
//  homework_api
//
//  Created by 형주 on 2021/07/25.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire
import SwiftyJSON


let APIkey = "UOmr7%2BwazwYpWR3qIDWPRlL5ktMmB0B8YEK39oOEz9JlWv23Cv2Sd4Jm8r1QUnkuK1kzF%2FkQF4A1YpQ1J5fosg%3D%3D"

class ViewController: UIViewController {
    var countries: country?
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("http://api.exchangeratesapi.io/v1/latest?access_key=59ba496813211c7d4056961e569ee43f",method: .get).responseJSON{
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let result = json["rates"]["KRW"].double {
                    print(result)
                }
                if let result2 = json["rates"]["USD"].double {
                    print(result2)
                }
//                self.resultText.text = result
                
            case .failure(_):
                return
            }
        }
        
    }
    @IBAction func ji(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func onKakaoLoginByAppTouched(_ sender: Any) {
            // 카카오톡 설치 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        // 예외 처리 (로그인 취소 등)
                        print(error)
                    }
                    else {
                        print("loginWithKakaoTalk() success.")
                        // do something
                        _ = oauthToken
                        // 어세스토큰
                        let accessToken = oauthToken?.accessToken
//                        self.label.text = "\(accessToken)"
                        //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                        self.setUserInfo()
                    }
                }
            }
            
        }
    
    @IBAction func onKakaoLoginByWebTouched(_ sender: Any) {
           UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
               if let error = error {
                   print(error)
               }
               else {
                   print("loginWithKakaoAccount() success.")
                   
                   //do something
                   _ = oauthToken
                   // 어세스토큰
                   let accessToken = oauthToken?.accessToken
                   
                   //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                   self.setUserInfo()
               }
           }
       }
    
    func setUserInfo() {
           UserApi.shared.me() {(user, error) in
               if let error = error {
                   print(error)
               }
               else {
                   print("me() success.")
                   //do something
                   _ = user
                
//                   self.label.text = user?.kakaoAccount?.profile?.nickname
                   
//                   if let url = user?.kakaoAccount?.profile?.profileImageUrl,
//                       let data = try? Data(contentsOf: url) {
////                       self.profileImageView.image = UIImage(data: data)
//                   }
               }
           }
        let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
       }
}

