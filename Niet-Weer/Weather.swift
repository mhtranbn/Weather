//
//  ForecastDaily.swift
//  Niet-Weer
//
//  Created by Jerrald Pieterman on 10-02-16.
//  Copyright © 2016 Jeppro. All rights reserved.
//

import Foundation
import Alamofire


class Weather {
    
    private var _currentWeatherUrl: String!
    private var _futureWeatherUrl: String!
    private var _location: String!
    private var _time: String!
    private var _day: String!
    private var _date: String!
    private var _temp: String!
    private var _minTemp: String!
    private var _maxTemp: String!
    private var _hum: String!
    private var _pres: String!
    private var _cloud: String!
    private var _windSpd: String!
    private var _windDir: String!
    private var _futureWeatherArr: [String:String]!
    
    var location: String {
        get {
            if _location == nil {
                _location = ""
            }
            return _location
        }
    }
    
    var time: String {
        get {
            if _time == nil {
                _time = ""
            }
            return _time
        }
    }
    
    var day: String {
        get {
            if _day == nil {
                _day = ""
            }
            return _day
        }
    }
    
    var date: String {
        get {
            if _date == nil {
                return ""
            }
            return _date
        }
    }
    
    var temp: String {
        get {
            if _temp == nil {
                _temp = ""
            }
            return _temp
        }
    }
    
    var minTemp: String {
        get {
            if _minTemp == nil {
                _minTemp = ""
            }
            return _minTemp
        }
    }
    
    var maxTemp: String {
        get {
            if _maxTemp == nil {
                _maxTemp = ""
            }
            return _maxTemp
        }
    }
    
    var hum: String {
        get {
            if _hum == nil {
                _hum = ""
            }
            return _hum
        }
    }
    
    var pres: String {
        get {
            if _pres == nil {
                _pres = ""
            }
            return _pres
        }
    }
    
    var cloud: String {
        get {
            if _cloud == nil {
                _cloud = ""
            }
            return _cloud
        }
    }
    
    var windSpd: String {
        get {
            if _windSpd == nil {
                _windSpd = ""
            }
            return _windSpd
        }
    }
    
    var windDir: String {
        get {
            if _windDir == nil {
                _windDir = ""
            }
            return _windDir
        }
    }
    
    var futureWeatherArr: [String: String] {
        get {
            if _futureWeatherArr == nil {
                _futureWeatherArr = ["":""]
            }
            return _futureWeatherArr
        }
    }

    
    
    
    init() {
        self._currentWeatherUrl = "\(BASE_URL)\(CURRENT_WEATHER)\(AMSTERDAM_URL)\(METRIC)\(APIKEY)"
        self._futureWeatherUrl = "\(BASE_URL)\(FUTURE_WEATHER)\(AMSTERDAM_URL)\(METRIC)\(APIKEY)"
    }
    
    
    
    
    func weatherDetails(completed: DownloadComplete) {
        
        let currentWeatherUrl = NSURL(string: self._currentWeatherUrl)!
        let futureWeatherUrl = NSURL(string: self._futureWeatherUrl)!
        
        Alamofire.request(.GET, currentWeatherUrl).responseJSON { secondResponse in
            Alamofire.request(.GET, futureWeatherUrl).responseJSON { firstResponse in
                let firstResult = firstResponse.result
                
                if let dict = firstResult.value as? Dictionary<String, AnyObject> {
                    if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                        for var i = 0; i < list[0].count; i++ {
                            if let timePassed = list[i]["dt"] as? Double {
                                let date = NSDate(timeIntervalSince1970: timePassed)
                                let timeFormatter = NSDateFormatter()
                                timeFormatter.dateFormat = "h:mm"
                                self._futureWeatherArr["time\(i)"] = timeFormatter.stringFromDate(date)
                            }
                        }
                    }
                }
                completed()
            }
            
            
            let secondResult = secondResponse.result
            
            if let dict = secondResult.value as? Dictionary<String, AnyObject> {
                if let location = dict["name"] as? String {
                    self._location = location
                }
                
                if let timePassed = dict["dt"] as? Double {
                    let date = NSDate(timeIntervalSince1970: timePassed)
                    
                    let dayFormatter = NSDateFormatter()
                    let dateFormatter = NSDateFormatter()
                    dayFormatter.dateFormat = "EEEE"
                    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                    self._day = dayFormatter.stringFromDate(date)
                    self._date = dateFormatter.stringFromDate(date)
                }
                
                if let main = dict["main"] as? Dictionary<String, Double> {
                    if let temp = main["temp"] {
                        self._temp = String(format: "%.0f", temp)
                    }
                    
                    if let minTemp = main["temp_min"] {
                        self._minTemp = String(format: "%.0f", minTemp)
                    }
                    
                    if let maxTemp = main["temp_max"] {
                        self._maxTemp = String(format: "%.0f", maxTemp)
                    }
                    
                    if let hum = main["humidity"] {
                        self._hum = String(format: "%.0f", hum)
                    }
                    
                    if let pres = main["pressure"] {
                        self._pres = String(format: "%.0f", pres)
                    }
                }
                
                if let clouds = dict["clouds"] as? Dictionary<String, Double> {
                    if let cloud = clouds["all"] {
                        self._cloud = String(format: "%.0f", cloud)
                    }
                }
                
                if let wind = dict["wind"] as? Dictionary<String, Double> {
                    if let windSpd = wind["speed"] {
                        self._windSpd = String(format: "%.0f", windSpd)
                    }
                    
                    if let windDir = wind["deg"] {
                        self._windDir = String(format: "%.0f", windDir)
                    }
                }
            }
//            completed()
        }
    }
}







































