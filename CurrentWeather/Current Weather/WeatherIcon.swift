//
//  WeatherIcon.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation
import UIKit

enum WeatherIcon{
    case clearDay
    case clearNight
    case rain
    case snow
    case sleet
    case wind
    case fog
    case cloudy
    case partlyCloudyDay
    case partlyCloudyNight
    case hail
    case storm
    case tornado
    case `default` 

    init(icon:String){
        switch icon {
        case "clear-day":           self = .clearDay
        case "clear-night":         self = .clearNight
        case "rain":                self = .rain
        case "snow":                self = .snow
        case "sleet":               self = .sleet
        case "wind":                self = .wind
        case "fog":                 self = .fog
        case "cloudy":              self = .cloudy
        case "partly-cloudy-day":   self = .partlyCloudyDay
        case "partly-cloudy-night": self = .partlyCloudyNight
        case "hail":                self = .hail
        case "storm":               self = .storm
        case "tornado":             self = .tornado
        default:                    self = .default
        }
    }
}

extension WeatherIcon{
    var image: UIImage{
        switch self {
        case .clearDay: return #imageLiteral(resourceName: "clear_day")
        case .clearNight: return #imageLiteral(resourceName: "clear_night")
        case .rain: return #imageLiteral(resourceName: "rain")
        case .snow: return #imageLiteral(resourceName: "snow")
        case .sleet: return #imageLiteral(resourceName: "sleet")
        case .wind: return #imageLiteral(resourceName: "wind")
        case .fog: return #imageLiteral(resourceName: "fog")
        case .cloudy: return #imageLiteral(resourceName: "cloudy")
        case .partlyCloudyDay: return #imageLiteral(resourceName: "partly_cloudy")
        case .partlyCloudyNight: return #imageLiteral(resourceName: "cloudy_night")
        case .hail: return #imageLiteral(resourceName: "hail")
        case .storm: return #imageLiteral(resourceName: "storm")
        case .tornado: return #imageLiteral(resourceName: "tornado")
        default:
            return #imageLiteral(resourceName: "default")
        }
    }
}
