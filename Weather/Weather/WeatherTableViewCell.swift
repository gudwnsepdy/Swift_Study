//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by 형주 on 2021/06/01.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    var statusName: String?
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!

    @IBOutlet weak var celcius: UILabel!
    @IBOutlet weak var rainfall: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
