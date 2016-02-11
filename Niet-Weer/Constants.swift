//
//  Constants.swift
//  Niet-Weer
//
//  Created by Jerrald Pieterman on 10-02-16.
//  Copyright © 2016 Jeppro. All rights reserved.
//

import Foundation


// http://api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID={APIKEY}

let APIKEY = "&APPID=d5782f04477f8b928b7f87f108667848"
let EEMSMOND_URL = "id=6544278"
let GRONINGEN_URL = "id=2755249"
let AMSTERDAM_URL = "id=2759794"
let METRIC = "&units=metric"
let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let CURRENT_WEATHER = "weather?"
let FUTURE_WEATHER = "forecast?"

typealias DownloadComplete = () -> ()