//
//  CurrentWeatherViewModel.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel{
    let temperature: String
    let humidity:String
    let summary:String
    let precipProbability: String
    let precipIntensity: String
    let windSpeed: String
    let windBearing: String
    let cloudCover: String
    let visibility: String
    let windGust: String
    let dewPoint: String
    let uvIndex: String
    let icon: UIImage
    
    init(model:CurrentWeather){
        let temperatureRounded = Int(model.temperature.rounded(FloatingPointRoundingRule.up))
        let humidityInPercent = Int(model.humidity * 100)
        let precipInPercent = Int(model.precipProbability * 100)
        let precipIntensityPercent = model.precipIntensity
        let windSpeedKm = Int(model.windSpeed)
        let windBearingDegrees = Int(model.windBearing)
        let cloudCoverPercent = Int(model.cloudCover * 100)
        let iconInImage = WeatherIcon(icon: model.icon)
        let windGustKm = Int(model.windGust)
        let dewPointDegrees = Int(model.dewPoint)
        let uvIndexInt = Int(model.uvIndex)
        
        if let visibilityKm = model.visibility{
            self.visibility = "\(Int(visibilityKm)) km"
        }else{
            self.visibility = "---"
        }
   
        self.temperature = "\(temperatureRounded)"
        self.humidity = "\(humidityInPercent) %"
        self.precipProbability = "\(precipInPercent) %"
        self.summary = model.summary
        self.precipIntensity = String(format: "%.2f mm/h",precipIntensityPercent)
        self.windBearing = "\(windBearingDegrees) º"
        self.windSpeed = "\(windSpeedKm) km/h"
        self.cloudCover = "\(cloudCoverPercent) %"
        self.windGust = "\(windGustKm) km/h"
        self.dewPoint = "\(dewPointDegrees) ºC"
        self.uvIndex = "\(uvIndexInt)"
        self.icon = iconInImage.image
    }
}
