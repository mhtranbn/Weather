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
    
    var futureWeatherArr: [String:String] {
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
        
        // Current Weather
        Alamofire.request(.GET, currentWeatherUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let location = dict["name"] as? String {
                    self._location = location
                }
                
                if let day = dict["dt"] as? Double {
                    let date = NSDate(timeIntervalSince1970: day)
                    let timeFormatter = NSDateFormatter()
                    let dayFormatter = NSDateFormatter()
                    let dateFormatter = NSDateFormatter()
                    timeFormatter.dateFormat = "h:mm a"
                    dayFormatter.dateFormat = "EEEE"
                    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                    self._time = timeFormatter.stringFromDate(date)
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
                }
            }
        }
        
        // Future Weather
        Alamofire.request(.GET, futureWeatherUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for var i = 0; i < list[0].count; i++ {
                        if let day = list[i]["dt"] as? Double {
                            let date = NSDate(timeIntervalSince1970: day)
                            let timeFormatter = NSDateFormatter()
                            let dayFormatter = NSDateFormatter()
                            let dateFormatter = NSDateFormatter()
                            timeFormatter.dateFormat = "h:mm"
                            dayFormatter.dateFormat = "EEEE"
                            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                            self._futureWeatherArr["time\(i)"] = timeFormatter.stringFromDate(date)
                            self._futureWeatherArr["day\(i)"] = dayFormatter.stringFromDate(date)
                            self._futureWeatherArr["date\(i)"] = dateFormatter.stringFromDate(date)
                        }
                    }
                }
            }
            completed()
        }
    }
}







































