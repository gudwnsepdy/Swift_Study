//
//  ViewController.swift
//  homework_api
//
//  Created by 형주 on 2021/07/25.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let params = ["serviceKey":"UOmr7%2BwazwYpWR3qIDWPRlL5ktMmB0B8YEK39oOEz9JlWv23Cv2Sd4Jm8r1QUnkuK1kzF%2FkQF4A1YpQ1J5fosg%3D%3D","pageNo":"1", "numOfRows":"10", "cond[country_nm::EQ]":"가나","cond[country_iso_alp2::EQ]":"GH"]
        AF.request("https://apis.data.go.kr/1262000/SptravelWarningService2",method: .get, parameters: params, encoding: URLEncoding.default)
                    .validate(statusCode: 200..<300)
                    .responseJSON { (response) in
                    let  JSON = response.result
                        print(JSON)
                    
                }
    }


}

