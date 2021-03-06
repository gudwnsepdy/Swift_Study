//
//  TastingSelect2ViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/05.
//

import UIKit

class TastingSelect2ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        header.backgroundColor = UIColor(red: 199/255, green: 116/255, blue: 104/255, alpha: 0)
//        header.backgroundColor = .systemOrange
        
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "선호하는 칵테일 \n단맛, 높은 도수 \n베이스, 신맛, 쓴맛"
        headerLabel.numberOfLines = 3
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 26)
        headerLabel.textColor = UIColor.white
        header.addSubview(headerLabel)
        
        headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 34).isActive = true

        tableView.tableHeaderView = header
        navigationController?.isNavigationBarHidden = true
//        AgainButton.layer.cornerRadius = 20
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CocktailResultTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell1") as! CocktailResultTableViewCell
        cell.CocktailImage?.image = UIImage(named: "1")
        cell.CocktailName?.text = "모히또"
        cell.CocktailInfo?.text = "단맛, 과일, 높은 도수"
        cell.CocktailAlc?.text = "Alc 16.2"
//        cell.layer.cornerRadius = 30
        cell.CocktailImage.layer.cornerRadius = 20
//        cell.view.layer.cornerRadius = 0
//        cell.view.layer.shadowColor = UIColor.gray.cgColor
//        cell.view.layer.shadowOpacity = 1.0
//        cell.view.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
//        cell.view.layer.shadowRadius = 2
        
        cell.layer.frame.size.height = 210
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "g"
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = .white
        headerView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        headerView.addShadow(offset: CGSize(width: 0, height: -4))
        
        return headerView
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//extension UIView {
//    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 3.0) {
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
//
