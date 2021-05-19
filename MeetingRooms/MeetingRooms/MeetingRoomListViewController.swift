//
//  MeetingRoomListViewController.swift
//  MeetingRooms
//
//  Created by 형주 on 2021/05/15.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {
    
    var meetingRooms: [String:[String:Int]] = ["Meeting":["Banksy":4, "Rivera":8, "Kahlo":8, "Picass":10], "Seminar":["Cezanne":20, "Matisse":30, "Renoir":40]]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return meetingRooms.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoryValues = Array(meetingRooms.values)[section]
        let orderedMeetingRooms = meetingRooms.sort({$0.1.first!.1 < $1.1.first!.1})
        let rowCount = orderedMeetingRooms[section].1.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        let categoryValue = Array(meetingRooms.values)[indexPath.section]
        
        
        let roomName = Array (categoryValue.keys)[indexPath.row]
        
        let capacity = Array (categoryValue.values)[indexPath.row]
        cell.textLabel!.text = roomName
        cell.detailTextLabel!.text = "\(capacity)"
       
        return cell
    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return Array(meetingRooms.keys)[section]
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let rowCount = Array(meetingRooms.values)[section].count
        return "\(rowCount) rooms"
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
