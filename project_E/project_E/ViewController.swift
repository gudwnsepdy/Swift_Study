//
//  ViewController.swift
//  project_E
//
//  Created by 형주 on 2021/06/07.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var orderType: String = "=0"
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "movieListCell"
    var movies: [Movies] = []
    
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIBarItem) {
        self.showAlertcontroller(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertcontroller(style: UIAlertController.Style) {
        let alertcontroller: UIAlertController
        alertcontroller = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: style)
        
        let rateAction: UIAlertAction
        rateAction = UIAlertAction(title: "예매율", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in print("OK pressed")
            self.navigationItem.title = "예매율"
            self.orderType = "=0"
            self.touchActionSheet()
        })
        
        let curatioAction: UIAlertAction
        curatioAction = UIAlertAction(title: "큐레이션", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in print("OK pressed")
            self.navigationItem.title = "큐레이션"
            self.orderType = "=1"
            self.touchActionSheet()
        })
        
        let releaseAction: UIAlertAction
        releaseAction = UIAlertAction(title: "개봉일", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in print("OK pressed")
            self.navigationItem.title = "개봉일순"
            self.orderType = "=2"
            self.touchActionSheet()
        })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertcontroller.addAction(rateAction)
        alertcontroller.addAction(curatioAction)
        alertcontroller.addAction(releaseAction)
        alertcontroller.addAction(cancelAction)
        
        
        self.present(alertcontroller, animated: true, completion: {
            print("Alert controller shown")
        })
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! MovieTableViewCell
        
        let movie: Movies = self.movies[indexPath.row]
        var ageGrade: String?
        switch movie.grade {
        case 0 :
            ageGrade = "ic_allages"
        case 12:
            ageGrade = "ic_12"
        case 15:
            ageGrade = "ic_15"
        case 19:
            ageGrade = "ic_19"
        default:
            ageGrade = "ic_allages"
        }
        cell.ageImage?.image = UIImage(named: ageGrade!)
        cell.movieInfo?.text = "평점 :"  + "\(movie.user_rating)" +  "예매 순위 : " + "\(movie.reservation_grade)" + " 예매율 : " + "\(movie.reservation_rate)"
        cell.movieTitle.text = movie.title
        cell.releaseDate.text = "개봉일 : " + movie.date
        cell.movieID = movie.id
//        guard let movieImageURL: URL = URL(string: movie.thumb) else {return cell}
//        guard let movieImageData: Data = try? Data(contentsOf: movieImageURL) else { return cell }
//        cell.movieImage?.image = UIImage(data: movieImageData)
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: movie.thumb) else { return  }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return  }
            
            DispatchQueue.main.async {
                if let index: IndexPath = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.movieImage?.image = UIImage(data: imageData)
                    }
                }
                
            }
        }
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url: URL = URL(string: "https://connect-boxoffice.run.goorm.io/movies?order_type=1") else {return}
        
        let session: URLSession = URLSession(configuration: .default)
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
                print("111")
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.movies = apiResponse.movies
                print(self.movies)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            } catch(let err) {
                print(err.localizedDescription)
                print("hihi")
            }
        }

        // 이때 dataTask를 실행하고 서버에 요청하게 된다.
        // 해당 클로저는 당장 실행할 코드가 아니라 요청에 대한 응답이 왔을때 실행한다.
        // 실질적으로 실행하는 코드는 세션만들고 데이타테스크 만들어서 실행하는것이 해당 함수에서 동작하는 코드이다.
        dataTask.resume()
        
    }

    func touchActionSheet() {
        guard let url: URL = URL(string: "https://connect-boxoffice.run.goorm.io/movies?order_type" + orderType) else {return}
        
        let session: URLSession = URLSession(configuration: .default)
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
                print("111")
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.movies = apiResponse.movies
                print(self.movies)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            } catch(let err) {
                print(err.localizedDescription)
                print("hihi")
            }
        }

        // 이때 dataTask를 실행하고 서버에 요청하게 된다.
        // 해당 클로저는 당장 실행할 코드가 아니라 요청에 대한 응답이 왔을때 실행한다.
        // 실질적으로 실행하는 코드는 세션만들고 데이타테스크 만들어서 실행하는것이 해당 함수에서 동작하는 코드이다.
        dataTask.resume()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: DetailTableViewController = segue.destination as? DetailTableViewController else {
            return
        }
        
        guard let cell: MovieTableViewCell = sender as? MovieTableViewCell else {
            return
        }
        
        
        nextViewController.movieID = cell.movieID!
        
        
        
    }
    
}

