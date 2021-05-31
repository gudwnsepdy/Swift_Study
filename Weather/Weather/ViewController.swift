//
//  ViewController.swift
//  Weather
//
//  Created by 형주 on 2021/05/30.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    let cellIdentifier: String = "cell"
    var countries: [Country] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CustomTableViewCell)
        
        cell.countryName?.text = countries[indexPath.row].korean_name
        cell.flagImage?.image = UIImage(named: "flag_" + countries[indexPath.row].asset_name)
        cell.cityName = countries[indexPath.row].asset_name
//        cell.flagImage?.image = UIImage(named: "flag_kr")
//        print( "flag_" + countries[indexPath.row].asset_name)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        print(countries)
        print(countries.count)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: CustomTableViewCell = sender as? CustomTableViewCell else {
            return
        }
        
        nextViewController.nation = cell.cityName
        
    }

}

