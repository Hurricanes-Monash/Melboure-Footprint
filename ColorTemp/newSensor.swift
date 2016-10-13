//
//  newSensor.swift
//  ColorTemp
//
//  Created by Michael on 13/10/2016.
//  Copyright © 2016 Michael. All rights reserved.
//

import UIKit

class newSensor: NSObject {
    var celsius: Float?
    var pressure: Float?
    var red: Float?
    var blue: Float?
    var green: Float?
    
    init(c:Float,p:Float,r:Float,b:Float,g:Float) {
        self.celsius = c
        self.pressure = p
        self.red = r
        self.blue = b
        self.green = g
    }
   

}
