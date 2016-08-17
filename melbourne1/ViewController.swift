//
//  ViewController.swift
//  melbourne1
//
//  Created by zihaowang on 17/08/2016.
//  Copyright © 2016 zihaowang. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

  
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    let imageUrlload:String? = "https://rexwh.files.wordpress.com/2013/11/colesfountain_20131117_1342_46.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()
         let ref = Firebase(url: "https://melbournefootprint.firebaseio.com/artworks")
        ref.childByAppendingPath("name").observeSingleEventOfType(.Value, withBlock: { snapshot in
            print( snapshot.value )
            self.nameLabel.text = String(snapshot.value)
            })
        ref.childByAppendingPath("description").observeSingleEventOfType(.Value, withBlock: { snapshot in
            print( snapshot.value )
            self.textView.text = String(snapshot.value)
        })
                imageView.image = nil
        if let imageUrl = imageUrlload {
            NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: imageUrl)!,completionHandler: {(data,response,error) -> Void in
                if error != nil {
                print(error)
                    return
                }
            let image = UIImage(data: data!)
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    self.imageView.image = image
                    ;
                    
            
                })
            
            }).resume()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

