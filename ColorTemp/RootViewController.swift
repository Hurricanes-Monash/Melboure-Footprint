//
//  RootViewController.swift
//  ColorTemp
//
//  Created by Michael on 7/10/2016.
//  Copyright © 2016 Michael. All rights reserved.
//

import UIKit


/*protocol addSensorDelegate{
    func addSensor(_number: Int)
}
*/

class RootViewController: UIViewController, UIPageViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate
 {
   // var delegate: addSensorDelegate?
    var number : Int?
    var tableTitle : String?
    var sensors = [newSensor]()
   
    @IBOutlet weak var pickerView: UIPickerView!
    var pageViewController: UIPageViewController?
    let pickerData = [
        ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39"
            ,"40","41","42","43","44","45","46","47","48","49","50"],
        ["Color","Pressure"," Temperature"]
    ]


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
    
    func downloadData(number:String)
    {
        var url:URL
        url = URL(string: "http://118.139.47.90:8081/history/"+number)!
        print(url)
        let session = URLSession.shared
        let task = session.dataTask(with: url){
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                self.sensors.removeAll()
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data!,options:.allowFragments) as! NSArray
                    for item in (jsonData as? [[String:Any]])!
                    {
                        print(item)
                        
                        
                        let pressure = item["pressure"] as? Float
//                       {
//                        self.sensor.pressure = pressure
//                        print(pressure)
//                        }
                        let celsius = item["celsius"] as? Float
                       
                        let red = (item["red"] as? Float)!
                        let blue = (item["blue"] as? Float)!
                        let green = (item["green"] as? Float)!
                        
//                        self.sensor.blue = blue
//                        self.sensor.red = red
//                        self.sensor.green = green
                        self.sensors.append(newSensor(c: celsius!,p: pressure!,r: red,b: blue,g: green))
                        print(self.sensors.count)

                    }
                                    }
                catch {
                    print("Error with Json: \(error)")
                }
               
                

            }
        }
        
        task.resume()
        
        
    }

    
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
        let numberofUpdate = pickerData[sizeComponent][pickerView.selectedRow(inComponent: sizeComponent)]
        let type = pickerData[toppingComponent][pickerView.selectedRow(inComponent: toppingComponent)]
        pizzaLabel.text = "You are looking for: " + numberofUpdate + " updates of " + type
        
        tableTitle = type
        number = Int(numberofUpdate)!
        downloadData(number: numberofUpdate)
    }
 
    @IBAction func done(_ sender: AnyObject) {
        print("no")

    //    self.delegate?.addSensor(_number: 6)
    }
    

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="showSensorData"){
            //let selectedRow = (tableView.indexPathForSelectedRow as NSIndexPath?)?.row
            if let dest = segue.destination as?
                SensorTableViewController{
                dest.title = tableTitle
                dest.numberofRow = number
                dest.tableSensors.removeAll()
                print(dest.tableSensors.count)
                dest.tableSensors = self.sensors
                print(dest.tableSensors.count)
            }

    
}

}
}




