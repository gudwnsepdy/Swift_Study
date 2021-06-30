//
//  CommentTableViewCell.swift
//  project_E
//
//  Created by 형주 on 2021/06/13.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var commentDate: UILabel!
    @IBOutlet weak var commentContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
