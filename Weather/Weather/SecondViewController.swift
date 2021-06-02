//
//  SecondViewController.swift
//  Weather
//
//  Created by 형주 on 2021/06/01.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource {
    
    
    let cellIdentifier: String = "weatherCell"

    var nation: String?
    var weathers: [Weather] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! WeatherTableViewCell)
        var imageName: String?
        
        switch weathers[indexPath.row].state {
        case 10:
            imageName = "sunny"
        case 11:
            imageName = "cloudy"
        case 12:
            imageName = "rainy"
        case 13:
            imageName = "snowy"
        default:
            imageName = "sunny"
        }
        cell.statusName = imageName
        cell.cityName?.text = weathers[indexPath.row].city_name
        cell.cityName?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.weatherImage?.image = UIImage(named: imageName!)
        
        
        let hwa: Float = weathers[indexPath.row].celsius * 1.8 + 32
        cell.celcius?.text = "섭씨" + "\(weathers[indexPath.row].celsius)" + "도 / 화씨 " + String(format: "%.1f", hwa) + "도"
        if weathers[indexPath.row].celsius <= 10 {
            cell.celcius.textColor = UIColor.blue
        }
        
        
        cell.rainfall?.text = "강수확률" + "\(weathers[indexPath.row].rainfall_probability)" + "%"
        if weathers[indexPath.row].rainfall_probability >= 50 {
            cell.rainfall.textColor = UIColor.orange
        }
//        cell.flagImage?.image = UIImage(named: "flag_kr")
//        print( "flag_" + countries[indexPath.row].asset_name)
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch nation {
        case "de" :
            title = "독일 "
        case "kr" :
            title = "한국"
        case "fr":
            title = "프랑스"
        case "it":
            title = "이탈리아"
        case "jp":
            title = "일본"
        case "us":
            title = "미국"
        default:
            title = "sunny"
        }
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: nation!) else {
            return
        }
        
        do {
            self.weathers = try jsonDecoder.decode([Weather].self, from: dataAsset.data)
        } catch { 
            print(error.localizedDescription)
        }
//        tableView.estimatedRowHeight = 500
//        self.tableView.rowHeight = 80
//        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: ThiirdViewController = segue.destination as? ThiirdViewController else {
            return
        }
        
        guard let cell: WeatherTableViewCell = sender as? WeatherTableViewCell else {
            return
        }
        switch cell.statusName {
        case "sunny":
            nextViewController.imageName = "sunny"
            nextViewController.statusName = "맑음"
        case "snowy":
            nextViewController.imageName = "snowy"
            nextViewController.statusName = "눈"
        case "rainy":
            nextViewController.imageName = "rainy"
            nextViewController.statusName = "비"
        case "cloudy":
            nextViewController.imageName = "cloudy"
            nextViewController.statusName = "구름"
        default:
            nextViewController.imageName = "구름"
        }
        
        nextViewController.tempStatus = cell.celcius.text
        nextViewController.percentName = cell.rainfall.text
        
        
    }
    
}
