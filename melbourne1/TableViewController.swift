//
//  TableViewController.swift
//  melbourne1
//
//  Created by zihaowang on 18/08/2016.
//  Copyright © 2016 zihaowang. All rights reserved.
//

import UIKit
import Firebase


class TableViewController: UITableViewController {

    var artworks = [Artworks]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        fetchArtworks()
        
    }
    func fetchArtworks(){
        
        let ref = Firebase(url: "https://melbourne-footprint.firebaseio.com/")
      

        ref.childByAppendingPath("Heritage").observeEventType(.ChildAdded, withBlock: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                let artwork = Artworks()
                artwork.setValuesForKeysWithDictionary(dictionary)
                self.artworks.append(artwork)
                dispatch_async(dispatch_get_main_queue(),{self.tableView.reloadData() } )
        }
        }, withCancelBlock: nil)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return artworks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as! TableViewCell

        let artwork = artworks[indexPath.row]
        cell.nameL.text = artwork.Name
        if let photo = artwork.Photo{
        
            let url = NSURL(string: photo)
            NSURLSession.sharedSession().dataTaskWithURL(url!,completionHandler: {(data,response,error) in
                if error != nil {
                print(error)
                return
                }
                dispatch_async(dispatch_get_main_queue(),{
                    cell.tableImageView.image = UIImage(data:data!)
                    })
        
        }).resume()
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewArtwork"
        {
        
            let indexPath = self.tableView.indexPathForSelectedRow!
            let controller: ViewDetailsController = segue.destinationViewController
            as! ViewDetailsController
            controller.currentArtwork = self.artworks[indexPath.row]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
