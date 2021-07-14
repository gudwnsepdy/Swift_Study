//
//  Result2TableViewController.swift
//  prac_collectionView
//
//  Created by 형주 on 2021/07/11.
//

import UIKit
import Network
//var baverageList: [String] = ["갈배","게토레이","나랑드","웰치스","칠성사이다","코카콜라","코코팜","티오피","파워에이드","펩시","포카리" ]
var bavCategory: [String] = ["과실음료","스포츠음료","사이다","과실향탄삼으료","사이다","콜라","과재음료","커피","스포츠음료","콜라","이온음료"]
var photoList: [UIImage] = [UIImage(named: "갈배")!, UIImage(named: "게토레이")! ,UIImage(named: "나랑드")!, UIImage(named: "웰치스")!, UIImage(named: "칠성사이다")!, UIImage(named: "코카콜라")!, UIImage(named: "코코팜")!, UIImage(named: "티오피")!, UIImage(named: "파워에이드")!, UIImage(named: "펩시")!, UIImage(named: "포카리")!]
var photoNameList: [String] = ["갈배","게토레이","나랑드","웰치스","칠성사이다","코카콜라","코코팜","티오피","파워에이드","펩시","포카리"]

class Result2TableViewController: UITableViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let monitor = NWPathMonitor(requiredInterfaceType: .wifi)
                let queue = DispatchQueue.global(qos: .background)
                monitor.start(queue: queue)
                monitor.pathUpdateHandler = { path in
                    if path.status == .satisfied {
                        print("wifi")
                    }
                    else{
                        print("@@@@@@")
                    }
                }
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        // Uncomment the following line to preserve selection between presentations

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        header.backgroundColor = UIColor(red: 199/255, green: 116/255, blue: 104/255, alpha: 0)
//        header.backgroundColor = .systemOrange
        
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "음료 리스트"
        headerLabel.numberOfLines = 3
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 26)
        headerLabel.textColor = UIColor.white
        header.addSubview(headerLabel)
        
        headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 34).isActive = true

        tableView.tableHeaderView = header
//        navigationController?.isNavigationBarHidden = true
        
//        AgainButton.layer.cornerRadius = 25
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CocktailResultTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! CocktailResultTableViewCell
//        if indexPath.row < baverageList.count {
//            cell.CocktailImage?.image = UIImage(named: baverageList[indexPath.row])
//            cell.CocktailName?.text = baverageList[indexPath.row]
//        }
//        else {
//            cell.CocktailImage?.image = photoList[indexPath.row - baverageList.count]
//            cell.CocktailName?.text = photoNameList[indexPath.row - baverageList.count]
//        }
        cell.CocktailImage?.image = photoList[indexPath.row]
        cell.CocktailName?.text = photoNameList[indexPath.row]
        cell.CocktailInfo?.text = bavCategory[indexPath.row]
//        cell.CocktailAlc?.text = "Alc 16.2"
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "g"
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = .white
        headerView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        headerView.addShadow(offset: CGSize(width: 0, height: -4))
        
        return headerView
    }
    @IBAction func TryAgainButton(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectAlcholViewController") as? SelectAlcholViewController
//        
//        self.navigationController?
//            .popToViewController(vc!, animated: true)
    }
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            photoList.remove(at: (indexPath as NSIndexPath).row)
            photoNameList.remove(at: (indexPath as NSIndexPath).row)
            bavCategory.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemtoMove = photoList[(fromIndexPath as NSIndexPath).row]
        photoList.remove(at: (fromIndexPath as NSIndexPath).row)
        photoList.insert(itemtoMove, at: (to as NSIndexPath).row)
        
        let itemtoMove2 = photoNameList[(fromIndexPath as NSIndexPath).row]
        photoNameList.remove(at: (fromIndexPath as NSIndexPath).row)
        photoNameList.insert(itemtoMove2, at: (to as NSIndexPath).row)
        
        let itemtoMove3 = bavCategory[(fromIndexPath as NSIndexPath).row]
        bavCategory.remove(at: (fromIndexPath as NSIndexPath).row)
        bavCategory.insert(itemtoMove3, at: (to as NSIndexPath).row)
    }
    

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let cell = sender as! CocktailResultTableViewCell
            let indexPath = self.tableView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.idx = Int(indexPath?.row ?? 0)
        }
    }

}
extension UIView {
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 3.0) {
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOffset = offset
            self.layer.shadowOpacity = opacity
            self.layer.shadowRadius = radius
        }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 1
        if #available(iOS 11, *) {
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            var masked = CACornerMask()
            if corners.contains(.topLeft) { masked.insert(.layerMinXMinYCorner) }
            if corners.contains(.topRight) { masked.insert(.layerMaxXMinYCorner) }
            if corners.contains(.bottomLeft) { masked.insert(.layerMinXMaxYCorner) }
            if corners.contains(.bottomRight) { masked.insert(.layerMaxXMaxYCorner) }
           
            self.layer.maskedCorners = masked
        }
        else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
}
