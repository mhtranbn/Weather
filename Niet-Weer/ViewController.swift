//
//  ViewController.swift
//  Niet-Weer
//
//  Created by Jerrald Pieterman on 10-02-16.
//  Copyright © 2016 Jeppro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // present outlets
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var minTempLbl: UILabel!
    @IBOutlet weak var maxTempLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var humLbl: UILabel!
    
    // future outlets
    @IBOutlet weak var futureWeatherTime0Lbl: UILabel!
    @IBOutlet weak var futureWeatherTime1Lbl: UILabel!
    @IBOutlet weak var futureWeatherTime2Lbl: UILabel!
    @IBOutlet weak var futureWeatherTime3Lbl: UILabel!
    @IBOutlet weak var futureWeatherTime4Lbl: UILabel!
    @IBOutlet weak var futureWeatherTime5Lbl: UILabel!
    
    @IBOutlet weak var futureWeatherDay0Lbl: UILabel!
    @IBOutlet weak var futureWeatherDay1Lbl: UILabel!
    @IBOutlet weak var futureWeatherDay2Lbl: UILabel!
    @IBOutlet weak var futureWeatherDay3Lbl: UILabel!
    @IBOutlet weak var futureWeatherDay4Lbl: UILabel!
    @IBOutlet weak var futureWeatherDay5Lbl: UILabel!

    
    
    
    var weather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather = Weather()
        
        weather.weatherDetails { () -> () in
            self.updateCurrentWeather()
            self.updateFutureWeather()
        }
    }
    
    
    
    func updateCurrentWeather() {
        locationLbl.text = weather.location
        tempLbl.text = "\(weather.temp)\u{B0}"
        minTempLbl.text = "\(weather.minTemp)\u{B0}"
        maxTempLbl.text = "\(weather.maxTemp)\u{B0}"
        dayLbl.text = weather.day
        dateLbl.text = weather.date
        humLbl.text = "\(weather.hum)\u{25}"
}
    
    func updateFutureWeather() {
        print(weather.futureWeatherArr)
        
//        futureWeatherDay0Lbl.text = weather.futureWeatherArr["day0"]
//        futureWeatherDay1Lbl.text = weather.futureWeatherArr["day1"]
//        futureWeatherDay2Lbl.text = weather.futureWeatherArr["day2"]
//        futureWeatherDay3Lbl.text = weather.futureWeatherArr["day3"]
//        futureWeatherDay4Lbl.text = weather.futureWeatherArr["day4"]
//        futureWeatherDay5Lbl.text = weather.futureWeatherArr["day5"]
//        
//        futureWeatherTime0Lbl.text = weather.futureWeatherArr["time0"]
//        futureWeatherTime1Lbl.text = weather.futureWeatherArr["time1"]
//        futureWeatherTime2Lbl.text = weather.futureWeatherArr["time2"]
//        futureWeatherTime3Lbl.text = weather.futureWeatherArr["time3"]
//        futureWeatherTime4Lbl.text = weather.futureWeatherArr["time4"]
//        futureWeatherTime5Lbl.text = weather.futureWeatherArr["time5"]
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

