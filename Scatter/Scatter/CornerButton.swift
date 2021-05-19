//
//  CornerButton.swift
//  Scatter
//
//  Created by 형주 on 2021/05/19.
//

import UIKit

class CornerButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
            // Drawing code
            self.clipsToBounds = true
            self.layer.cornerRadius = self.frame.size.height / 2
        }
}
