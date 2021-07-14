//
//  ResultViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/06.
//

import UIKit

class ResultViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CocktailResultTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! CocktailResultTableViewCell
        cell.CocktailImage?.image = UIImage(named: "1")
        cell.CocktailName?.text = "모히또"
        cell.CocktailInfo?.text = "단맛, 과일, 높은 도수"
        cell.CocktailAlc?.text = "Alc 16.2"
        cell.layer.cornerRadius = 30
        cell.CocktailImage.layer.cornerRadius = 20
        cell.view.layer.cornerRadius = 20
        cell.view.layer.shadowColor = UIColor.gray.cgColor
        cell.view.layer.shadowOpacity = 1.0
        cell.view.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        cell.view.layer.shadowRadius = 2
        
        cell.layer.frame.size.height = 210
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10
//    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        tableView.addShadow(offset: CGSize(width: 0, height: -3))
        tableView.rowHeight = UITableView.automaticDimension

        self.navigationController?.navigationBar.isHidden = true
        
        
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
//        header.backgroundColor = UIColor(red: 199.0/255.0, green: 116.0/225.0, blue: 104.0/255.0, alpha: 0.0)
//
//        let headerLabel = UILabel(frame: header.bounds)
//        headerLabel.text = "선호하는 칵테일"
//        headerLabel.textAlignment = .center
//        header.addSubview(headerLabel)
//        tableView.tableHeaderView = header
//        tableView.tableHeaderView = REsu
        // Do any additional setup after loading the view.
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
//extension UITableView {
//    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
//            self.layer.masksToBounds = false
//            self.layer.shadowColor = color.cgColor
//            self.layer.shadowOffset = offset
//            self.layer.shadowOpacity = opacity
//            self.layer.shadowRadius = radius
//        }
//    
//    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.7
//        self.layer.shadowOffset = CGSize(width: 1, height: 1)
//        self.layer.shadowRadius = 1
//        if #available(iOS 11, *) {
//            self.clipsToBounds = true
//            self.layer.cornerRadius = radius
//            var masked = CACornerMask()
//            if corners.contains(.topLeft) { masked.insert(.layerMinXMinYCorner) }
//            if corners.contains(.topRight) { masked.insert(.layerMaxXMinYCorner) }
//            if corners.contains(.bottomLeft) { masked.insert(.layerMinXMaxYCorner) }
//            if corners.contains(.bottomRight) { masked.insert(.layerMaxXMaxYCorner) }
//           
//            self.layer.maskedCorners = masked
//        }
//        else {
//            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//            let mask = CAShapeLayer()
//            mask.path = path.cgPath
//            layer.mask = mask
//        }
//    }
//}
