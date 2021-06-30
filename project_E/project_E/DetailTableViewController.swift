//
//  DetailTableViewController.swift
//  project_E
//
//  Created by 형주 on 2021/06/13.
//

import UIKit

class DetailTableViewController: UIViewController, UITableViewDataSource {

    var movieID: String = ""
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var InfoView: MovieInfoView!
//    @IBOutlet weak var movieTitle: UILabel!
//    @IBOutlet weak var releaseDate: UILabel!
//    @IBOutlet weak var genreLable: UILabel!
//    @IBOutlet weak var reservationRateLable: UILabel!
//    @IBOutlet weak var userRatingLabel: UILabel!
//    @IBOutlet weak var audienceLabel: UILabel!
//    @IBOutlet weak var directorLabel: UILabel!
//    @IBOutlet weak var actorLabel: UILabel!
//    @IBOutlet weak var synopsisTextView: UILabel!
//    @IBOutlet weak var movieThumbImageView: UIImageView!
//    @IBOutlet weak var gradeImageView: UIImageView!
    
    var comments: [Comment] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CommentTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Comments") as! CommentTableViewCell
        cell.nickName?.text = comments[indexPath.row].writer
        cell.commentDate?.text = "\(comments[indexPath.row].timestamp)"
        cell.commentContent?.text = comments[indexPath.row].contents
//        cell.height = 130
        return cell
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InfoView.invalidateIntrinsicContentSize()
        print("*********")
        print(InfoView.synopsisTextView.calculateMaxLines())
        
        InfoView.frame.size.height += CGFloat(Float(InfoView.synopsisTextView.calculateMaxLines() * 200))
//        InfoView.frame.size.height += 1000
        tableView.rowHeight = UITableView.automaticDimension
        
//        InfoView.frame.size.height =
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 130
//        tableView.estimatedRowHeight = 500
//        self.tableView.rowHeight = 200
//        tableView.rowHeight = UITableView.automaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let movieURL: String = "https://connect-boxoffice.run.goorm.io/movie?id=" + "\(self.movieID)"
        guard let url: URL = URL(string: movieURL) else {return}
        print(url)
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

            
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else {return}
            do {
                
                print("111")
                let apiResponse: Movie = try JSONDecoder().decode(Movie.self, from: data)
                print(apiResponse)
                var ageGrade: String?
                DispatchQueue.main.async {
                    self.InfoView.movieTitle.text = apiResponse.title
                    self.InfoView.releaseDate.text = apiResponse.date
                    self.InfoView.genreLable.text = apiResponse.genre
                    self.InfoView.audienceLabel.text = "\(apiResponse.audience)" + "명"
                    self.InfoView.audienceLabel.adjustsFontSizeToFitWidth = true
                    self.InfoView.userRatingLabel.text = "\(apiResponse.user_rating)"
                    self.InfoView.reservationRateLable.text = "\(apiResponse.reservation_rate)"
                    self.InfoView.synopsisTextView.numberOfLines = 0
                    self.InfoView.synopsisTextView.lineBreakMode = .byWordWrapping
                    self.InfoView.synopsisTextView.invalidateIntrinsicContentSize()
                    
//                    self.synopsisTextView.frame.height = heightForView(text: apiResponse.synopsis, font: UIFont(name: "Helvetica", size: 20.0)!, width: 100)
                    self.InfoView.synopsisTextView.lineBreakStrategy = .hangulWordPriority
                    self.InfoView.synopsisTextView.sizeToFit()
                    
                    
                    self.InfoView.synopsisTextView.text = apiResponse.synopsis
                    
                    
                    
//                    self.synopsisTextView.adjustsFontSizeToFitWidth = true
//                    self.synopsisTextView.sizeToFit()
                    self.InfoView.actorLabel.text = apiResponse.actor
                    self.InfoView.actorLabel.adjustsFontSizeToFitWidth = true
                    self.InfoView.directorLabel.text = apiResponse.director
                    switch apiResponse.grade {
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
                    self.InfoView.gradeImageView?.image = UIImage(named: ageGrade!)
                    }
                
                
                DispatchQueue.global().async {
                    guard let imageURL: URL = URL(string: apiResponse.image) else { return  }
                    guard let imageData: Data = try? Data(contentsOf: imageURL) else { return  }
                    DispatchQueue.main.async {
                        self.InfoView.movieThumbImageView?.image = UIImage(data: imageData)
                        }
                    
                }
                
                
                
                
            } catch(let err) {
                print(err.localizedDescription)
                print("hihi")
            }
        }

        dataTask.resume()
        
        
        
        guard let url: URL = URL(string: "https://connect-boxoffice.run.goorm.io/comments?movie_id=" + "\(self.movieID)" ) else {return}
        
        let session2: URLSession = URLSession(configuration: .default)
        let dataTask2: URLSessionDataTask = session2.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

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
                let apiResponse: CommentsAPIResponse = try JSONDecoder().decode(CommentsAPIResponse.self, from: data)
                self.comments = apiResponse.comments
                print(self.comments)
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
        dataTask2.resume()
        InfoView.invalidateIntrinsicContentSize()
    }

   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font!], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}
