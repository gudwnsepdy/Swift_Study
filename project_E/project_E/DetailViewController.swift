//
//  DetailViewController.swift
//  project_E
//
//  Created by 형주 on 2021/06/07.
//

import UIKit

class DetailViewController: UIViewController {
    var movieID: String = ""
    
    
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genreLable: UILabel!
    @IBOutlet weak var reservationRateLable: UILabel!
    @IBOutlet weak var userRatingLabel: UILabel!
    @IBOutlet weak var audienceLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UILabel!
    @IBOutlet weak var movieThumbImageView: UIImageView!
    @IBOutlet weak var gradeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
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
                    self.movieTitle.text = apiResponse.title
                    self.releaseDate.text = apiResponse.date
                    self.genreLable.text = apiResponse.genre
                    self.audienceLabel.text = "\(apiResponse.audience)" + "명"
                    self.audienceLabel.adjustsFontSizeToFitWidth = true
                    self.userRatingLabel.text = "\(apiResponse.user_rating)"
                    self.reservationRateLable.text = "\(apiResponse.reservation_rate)"
                    self.synopsisTextView.numberOfLines = 0
                    self.synopsisTextView.lineBreakMode = .byWordWrapping
                    self.synopsisTextView.invalidateIntrinsicContentSize()
                    
//                    self.synopsisTextView.frame.height = heightForView(text: apiResponse.synopsis, font: UIFont(name: "Helvetica", size: 20.0)!, width: 100)
                    self.synopsisTextView.lineBreakStrategy = .hangulWordPriority
                    self.synopsisTextView.sizeToFit()
                    
                    
                    self.synopsisTextView.text = apiResponse.synopsis
                    
                    
                    
//                    self.synopsisTextView.adjustsFontSizeToFitWidth = true
//                    self.synopsisTextView.sizeToFit()
                    self.actorLabel.text = apiResponse.actor
                    self.actorLabel.adjustsFontSizeToFitWidth = true
                    self.directorLabel.text = apiResponse.director
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
                    self.gradeImageView?.image = UIImage(named: ageGrade!)
                    }
                
                
                DispatchQueue.global().async {
                    guard let imageURL: URL = URL(string: apiResponse.image) else { return  }
                    guard let imageData: Data = try? Data(contentsOf: imageURL) else { return  }
                    DispatchQueue.main.async {
                        self.movieThumbImageView?.image = UIImage(data: imageData)
                        }
                    
                }
                
                
                
                
            } catch(let err) {
                print(err.localizedDescription)
                print("hihi")
            }
        }

        dataTask.resume()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
//        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.greatestFiniteMagnitude))
//        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.font = font
//        label.text = text
//
//        label.sizeToFit()
//        return label.frame.height
//    }
}
