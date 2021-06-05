//
//  Request.swift
//  Networking
//
//  Created by 형주 on 2021/06/05.
//

import Foundation

let DidReceiveFriendsNotification: Notification.Name = Notification.Name("DidRecieveFriends")

func requestFriend() {
    guard let url: URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {return}

            // session을 만들어주고
        let session: URLSession = URLSession(configuration: .default)

        // dataTask를 만들어주는데, 이를 만들때 url로 요청할 것이며
        // 해당 클로저는 요청에 대한 서버의 응답이 왔을 때 호출될 클로저를 의미한다
        // 서버에서 보내준 데이터와 응답 그리고 에러가 발생하면 오류가 들어오게 된다.
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

            // 오류에 대한 응답
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else {return}
            do {
                // 받아온 데이터를 가지고 json decorder를 이용해 apiresponse 형식으로 디코더 해본다
                // response의 결과가 들어와있다면 friends에 넣어주고 테이블뷰를 reload해준다
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                
                NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil, userInfo: ["friends":apiResponse.results])
                
            } catch(let err) {
                print(err.localizedDescription)
            }
        }

        // 이때 dataTask를 실행하고 서버에 요청하게 된다.
        // 해당 클로저는 당장 실행할 코드가 아니라 요청에 대한 응답이 왔을때 실행한다.
        // 실질적으로 실행하는 코드는 세션만들고 데이타테스크 만들어서 실행하는것이 해당 함수에서 동작하는 코드이다.
        dataTask.resume()
}
