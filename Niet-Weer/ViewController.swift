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
    @IBOutlet weak var presLbl: UILabel!
    @IBOutlet weak var cloudLbl: UILabel!
    @IBOutlet weak var windSpdLbl: UILabel!
    @IBOutlet weak var windDirLbl: UILabel!
    
    var weather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather = Weather()
        
        weather.weatherDetails { () -> () in
            self.updateCurrentWeather()
            print(self.weather.futureWeatherArr)
        }
    }
    
    func updateCurrentWeather() {
        locationLbl.text = weather.location
        tempLbl.text = "\(weather.temp)\u{B0}"
        minTempLbl.text = "min. \(weather.minTemp)\u{B0}"
        maxTempLbl.text = "max. \(weather.maxTemp)\u{B0}"
        dayLbl.text = weather.day
        dateLbl.text = weather.date
        humLbl.text = "\(weather.hum)\u{25}"
        presLbl.text = weather.pres
        cloudLbl.text = "\(weather.cloud)\u{25}"
        windSpdLbl.text = "\(weather.windSpd) km/u"
        windDirLbl.text = weather.windDir
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

