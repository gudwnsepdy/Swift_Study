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



class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var APIResult: [country]?
//        let url = "http://apis.data.go.kr/1262000/SptravelWarningService2/getSptravelWarningList2?serviceKey=UOmr7%2BwazwYpWR3qIDWPRlL5ktMmB0B8YEK39oOEz9JlWv23Cv2Sd4Jm8r1QUnkuK1kzF%2FkQF4A1YpQ1J5fosg%3D%3D&pageNo=1&numOfRows=10"
        let url = "http://apis.data.go.kr/1262000/SptravelWarningService2/getSptravelWarningList2"
//        let header : HTTPHeaders = ["content-type": "application/json"]
        let param : Parameters = ["serviceKey":"UOmr7%2BwazwYpWR3qIDWPRlL5ktMmB0B8YEK39oOEz9JlWv23Cv2Sd4Jm8r1QUnkuK1kzF%2FkQF4A1YpQ1J5fosg%3D%3D",
                      "pageNo":1,
                      "numOfRows":10]
        AF.request(url ,
                   method: .get,
                   parameters: param,
                   encoding: JSONEncoding.default
                   
                   )
                    .validate(statusCode: 0..<600)
                    .responseJSON { response in
                        switch response.result
                        {
                        case .success(_) :do {
                            print("success")
                            print(response.result)
//                            APIResult = response.result
                            }
                        case .failure(let error):
                            print("failure(error)",error)

                            break
                        }
                    }
    }
    
    func appflagsmountain() {
//        let headers : HTTPHeaders = [ “X-ACCESS-TOKEN” : Constant.JWTToken ]
//        let parameters : Parameters = [ “mountain” : mountainName]
        let param : Parameters = ["serviceKey":"UOmr7%2BwazwYpWR3qIDWPRlL5ktMmB0B8YEK39oOEz9JlWv23Cv2Sd4Jm8r1QUnkuK1kzF%2FkQF4A1YpQ1J5fosg%3D%3D",
                      "pageNo":1,
                      "numOfRows":10]
        AF.request("http://apis.data.go.kr/1262000/SptravelWarningService2/getSptravelWarningList2", method: .get, parameters: param).validate().responseJSON { response in
          switch response.result {
          case .success(let response):
            if response.isSuccess, let result = response.result{
              viewcontroller.successDataMountain(result)
              print(“성공“)
            }
            else {
              viewcontroller.failureNoDataMountain(response.message)
              print(“왜그래?“)
            }
          case .failure(let errror) :
            viewcontroller.failureNoDataMountain(“네트워크가 연결되어 있지 않습니다.“)
          }
        }
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
       }
}

