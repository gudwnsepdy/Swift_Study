//
//  CostumTableViewCell.swift
//  Weather
//
//  Created by 형주 on 2021/05/30.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var cityName: String!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
