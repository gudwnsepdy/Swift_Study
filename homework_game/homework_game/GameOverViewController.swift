//
//  GameOverViewController.swift
//  homework_game
//
//  Created by 형주 on 2021/07/18.
//

import UIKit

class GameOverViewController: UIViewController {
    var final_score : Int?
    @IBOutlet weak var score_label: UILabel!
    @IBOutlet weak var max_score: UILabel!
    @IBOutlet weak var new_best: UIStackView!
    @IBOutlet weak var AgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.new_best.isHidden = true
        self.score_label.text = "점수 : " + "\(final_score!)"
        
        
        let defaults = UserDefaults.standard
        var array = defaults.array(forKey: "SavedIntArray")  as? [Int] ?? [Int]()
        array.append(final_score ?? 0)
        defaults.set(array, forKey: "SavedIntArray")
        if final_score == array.max() {
            new_best_score()
        }
        if let max_value = array.max() {
            self.max_score.text = "👑 최고점수 : " + "\(max_value)"
        }
        self.AgainButton.layer.cornerRadius = 10
        
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        usleep(3000000)
//        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func backButton(_ sender: Any) {
            self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func new_best_score() {
        UIView.animate(withDuration: 4.0, animations: {
            self.new_best.isHidden = false
            self.new_best.alpha = 0.0
        })
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
