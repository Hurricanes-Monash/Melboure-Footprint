//
//  SensorTableViewController.swift
//  ColorTemp
//
//  Created by Michael on 12/10/2016.
//  Copyright © 2016 Michael. All rights reserved.
//

import UIKit

class SensorTableViewController: UITableViewController /*,addSensorDelegate */{
   
 /*   func addSensor(_number: Int) {
        print("yes")
    }
    */
    
  
    var numberofRow : Int?
    var tableSensors = [newSensor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(numberofRow)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableSensors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Basic")!
            let sensor = tableSensors[(indexPath as NSIndexPath).row]
            //let red = sensor.red!
            //255.0 as CGFloat
           // let red = sensor.red! * 0.255 as! CGFont
           // print(red)
           // let green = sensor.green!  * 0.255 as! CGFont
           // let blue = sensor.blue!  * 0.255 as! CGFont
          //  let aaa = 255 as Float
            let red = sensor.red!  / 1000
            print(red)
            let green = sensor.green! / 1000
            print("green is" )
            print(green)
            let blue = sensor.blue! / 1000
            if self.title == "Color"{
            cell.textLabel?.text = "The sensed color NO.\(indexPath.row+1) "
            cell.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
            }
            else if self.title == "Pressure"{
                let presure = sensor.pressure!
                cell.textLabel?.text = "The presure NO.\(indexPath.row+1) is \(presure)Pa"
            }
            else{
                let tem = sensor.celsius!
                cell.textLabel?.text = "The temperature NO.\(indexPath.row+1) is \(tem)℃"
            }
            
            return cell
            
    }

    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    
    /*
     let red = sensor.red!  / 255
     print(red)
     let green = sensor.green! / 255
     print("green is" )
     print(green)
     let blue = sensor.blue! / 255
     print(red)

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
