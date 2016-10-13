//
//  SensorDataViewController.swift
//  ColorTemp
//
//  Created by Michael on 13/10/2016.
//  Copyright © 2016 Michael. All rights reserved.
//

import UIKit
import Foundation

class SensorData: UIViewController {

    var celsius: Int
    var pressure: Int
    var red: Int
    var blue: Int
    var green: Int
    
    
    
    
    
    
  // init(celsius: Int, pressure: Int, red: Int, blue: Int, green: Int) {
        
      //  self.celsius = celsius
      //  self.pressure = pressure
      //  self.red = red
      //  self.blue = blue
    //    self.green = green
  //      super.init()
     //   super.init(coder: CGRect)
       // super.init(coder : NSCoder)
       // super.init(coder: aDecoder)
//}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

   // override func viewDidLoad() {
     //   super.viewDidLoad()

        // Do any additional setup after loading the view.
    //}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
