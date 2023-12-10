//
//  ViewController.swift
//  StockAPIExample
//
//  Created by 耿露 on 12/9/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weatherValues: [WeatherClass] = [WeatherClass]()
    
    var weatherNames = ["SEA", "SFO", "PDX", "NYC", "MIA"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getWeatherValues(_ sender: Any) {
        var weathers = ""
        for weather in weatherNames{
            weathers.append("\(weather),")
        }
        let weatherStr = weathers.dropLast()
        let url = "\(baseURL)"
        print(url)
        SwiftSpinner.show("Getting weather Values")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print(response.error?.localizedDescription ?? "Error")
                return
            }
    
            print (response.data)
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else{return}
            print (rawData)
            self.weatherValues = [WeatherClass]()
            for weatherJSON in jsonArray{
                print("Weather: \(weatherJSON)")
                let city = weatherJSON["city"].stringValue
                let temperature = weatherJSON["temperature"].intValue
                let conditions = weatherJSON["conditions"].stringValue
                
                let weatherClass = WeatherClass()
                weatherClass.city = city
                weatherClass.temperature = temperature
                weatherClass.conditions = conditions
                self.weatherValues.append(weatherClass)
                
            }
            self.tblView.reloadData()
        }
    }
//    @IBAction func getWeatherValues(_ sender: Any) {
//
//        var weathers = ""
//        for weather in weatherNames{
//            weathers.append("\(weather),")
//        }
//        let weatherStr = weathers.dropLast()
//        let url = "\(baseURL)\(weatherStr)?apikey=\(apiKey)"
//        print(url)
//        SwiftSpinner.show("Getting weather Values")
//
//        AF.request(url).responseJSON { response in
//            SwiftSpinner.hide()
//            if response.error != nil {
//                print(response.error?.localizedDescription ?? "Error")
//                return
//            }
//            guard let rawData = response.data else {return}
//            guard let jsonArray = JSON(rawData).array else{return}
//
//            self.weatherValues = [WeatherClass]()
//            for weatherJSON in jsonArray{
//                print("Weather: \(weatherJSON)")
//                let city = weatherJSON["city"].stringValue
//                let temperature = weatherJSON["temperature"].intValue
//                let conditions = weatherJSON["conditions"].stringValue
//
//                let weatherClass = WeatherClass()
//                weatherClass.city = city
//                weatherClass.temperature = temperature
//                weatherClass.conditions = conditions
//                self.weatherValues.append(weatherClass)
//
//            }
//            self.tblView.reloadData()
//        }
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let city = weatherValues[indexPath.row].city
        let temperature = weatherValues[indexPath.row].temperature
        cell.textLabel?.text = "City: \(city) Tempreture: \(temperature)"
        return cell
    }
}

