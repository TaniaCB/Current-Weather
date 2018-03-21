//
//  CurrentWeather.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation

struct CurrentWeather{
    let temperature:Double
    let humidity:Double
    let summary:String
    let precipProbability: Double
    let precipIntensity: Double
    let windSpeed: Double
    let windBearing: Int
    let cloudCover: Double
    let visibility: Double?
    let windGust: Double
    let uvIndex: Double
    let dewPoint: Double
    let icon: String
    
    init(temperature:Double, humidity: Double, summary: String, rain: Double, intensity: Double, speed: Double, bearing: Int, cloud: Double, visibility: Double, gust: Double, uv: Double, dewPoint: Double, icon: String){
        self.temperature = temperature
        self.humidity = humidity
        self.summary = summary
        self.precipProbability = rain
        self.precipIntensity = intensity
        self.windSpeed = speed
        self.windBearing = bearing
        self.cloudCover = cloud
        self.visibility = visibility
        self.windGust = gust
        self.uvIndex = uv
        self.dewPoint = dewPoint
        self.icon = icon
    }
}

extension CurrentWeather{
    struct Key{
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
        static let precipIntensity = "precipIntensity"
        static let windSpeed = "windSpeed"
        static let windBearing = "windBearing"
        static let cloudCover = "cloudCover"
        static let visibility = "visibility"
        static let windGust = "windGust"
        static let uvIndex = "uvIndex"
        static let dewPoint = "dewPoint"
    }
    
    init?(json: [String: AnyObject]) {
        guard let tempValue = json[Key.temperature] as? Double,
        let humidityValue = json[Key.humidity] as? Double,
        let precipProbabilityValue = json[Key.precipProbability] as? Double,
        let summaryValue = json[Key.summary] as? String,
        let precipIntensityValue = json[Key.precipIntensity] as? Double,
        let windSpeedValue = json[Key.windSpeed] as? Double,
        let windBearingValue = json[Key.windBearing] as? Int,
        let cloudCoverValue = json[Key.cloudCover] as? Double,
        let windGustValue = json[Key.windGust] as? Double,
        let uvIndexValue = json[Key.uvIndex] as? Double,
        let dewPointValue = json[Key.dewPoint] as? Double,
        let iconValue = json[Key.icon] as? String else{
                return nil
        }
        
        
        if let visibilityValue = json[Key.visibility] as? Double{
            self.visibility = visibilityValue
        }else{
            self.visibility = nil
        }
        
        self.temperature = tempValue
        self.humidity = humidityValue
        self.summary = summaryValue
        self.precipProbability = precipProbabilityValue
        self.precipIntensity = precipIntensityValue
        self.windSpeed = windSpeedValue
        self.windBearing = windBearingValue
        self.cloudCover = cloudCoverValue
        self.windGust = windGustValue
        self.uvIndex = uvIndexValue
        self.dewPoint = dewPointValue
        self.icon = iconValue
    }
    
    
}
