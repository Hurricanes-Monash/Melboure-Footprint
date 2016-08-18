//
//  ViewDetailsController.swift
//  melbourne1
//
//  Created by zihaowang on 17/08/2016.
//  Copyright © 2016 zihaowang. All rights reserved.
//

import UIKit
import Firebase


class ViewDetailsController: UIViewController {

  
    var currentArtwork : Artworks?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.nameLabel.text = currentArtwork?.Name
        
            self.textView.text = currentArtwork?.Descriptions
                imageView.image = nil
        if let imageUrl = currentArtwork?.Photo {
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

