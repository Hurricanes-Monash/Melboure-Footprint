//
//  RootViewController.swift
//  ColorTemp
//
//  Created by Michael on 7/10/2016.
//  Copyright © 2016 Michael. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate
 {

    @IBOutlet weak var pickerView: UIPickerView!
    var pageViewController: UIPageViewController?
    let pickerData = [
        ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"],
        ["Color","Pressure"," Temperature"]
    ]

    var pickerDataSource = ["White", "Red", "Green", "Blue"];

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(2, inComponent:sizeComponent, animated: false)
        updateLabel()
        // Do any additional setup after loading the view, typically from a nib.
        //Run list running jsonTest.js
/*        let requestURL: NSURL = NSURL(string: "http://118.139.61.59:8081/listUsers")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? [String: AnyObject]
                    
                    if let stations = json?["stations"] as? [[String: AnyObject]] {
                        
                        for station in stations {
                            
                            if let name = station["stationName"] as? String {
                                
                                if let year = station["buildYear"] as? String {
                                    print(name,year)
                                }
                                
                            }
                        }
                        
                    }
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        
        task.resume() */
    }

  
    
    @IBOutlet weak var pizzaLabel: UILabel!
   
    
    let sizeComponent = 0
    let toppingComponent = 1
    
    
    
    //MARK: - Picker View Data Sources and Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_
        pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
        ) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(_
        pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int)
    {
        updateLabel()
    }
    
    //MARK: - Instance Methods
    func updateLabel(){
        let size = pickerData[sizeComponent][pickerView.selectedRow(inComponent: sizeComponent)]
        let topping = pickerData[toppingComponent][pickerView.selectedRow(inComponent: toppingComponent)]
        pizzaLabel.text = "You are looking for: " + size + " updates of " + topping
    }
 
       
}




