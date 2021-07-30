//
//  SecondViewController.swift
//  homework_api
//
//  Created by 형주 on 2021/07/27.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController {

    @IBOutlet weak var languagePicker: UIPickerView!
    @IBOutlet weak var myText: UITextField!
    @IBOutlet weak var resultText: UILabel!
    var list = ["영어","일본어","중국어 간체","중국어 번체", "베트남어", "인도네시아어", "태국어", "독일어", "러시아어", "스페인어", "이탈리아어", "프랑스어"]
    var langNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        languagePicker.delegate = self
        languagePicker.dataSource = self
    }
    
    func translate() {
        var lang: String?
        var originText = self.myText.text
        switch langNum {
        case 0:
            lang = "en"
        case 1:
            lang = "ja"
        case 2:
            lang = "zh-CN"
        case 3:
            lang = "zh-TW"
        case 4:
            lang = "vi"
        case 5:
            lang = "id"
        case 6:
            lang = "th"
        case 7:
            lang = "de"
        case 8:
            lang = "ru"
        case 9:
            lang = "es"
        case 10:
            lang = "it"
        case 11:
            lang = "fr"
        default:
            lang = "en"
        }
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        var params = ["source":"ko",
                      "target":lang,
                      "text": originText]
        var header: HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8",
                      "X-Naver-Client-Id":"QoVjI1DLJVsszuw6pl6B",
                      "X-Naver-Client-Secret":"28r_GwpJTb"]
        
        AF.request(url,method: .post, parameters: params, headers: header).responseJSON{
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let result = json["message"]["result"]["translatedText"].string
                self.resultText.text = result
                print(result)
            case .failure(_):
                return
            }
        }
    }
    @IBAction func button(_ sender: Any) {
        translate()
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
extension SecondViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select=\(row)")
        self.langNum = row
    }
}
