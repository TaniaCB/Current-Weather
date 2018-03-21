//
//  DarkSkyClient.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation

class DarkSkyClient{
    fileprivate let apiKey = "Enter here your Dark Sky API"
    
    lazy var baseURL: URL = {
       return URL(string: "https://api.darksky.net/forecast/\(apiKey)/")!
    }()
    
    let jsonDownloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(coordinate: Coordinate, completion: @escaping(CurrentWeatherCompletionHandler)) -> Void{
        let codlanguage = NSLocalizedString("language", comment: "") //Set information in English or Spanish
        
        guard let url = URL(string: "\(coordinate.description)?lang=\(codlanguage)&units=ca", relativeTo: baseURL) else{
            completion(nil,DarkSkyError.invalidURL)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = jsonDownloader.jsonTask(request: request) { (json, error) in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else{
                    completion(nil, DarkSkyError.jsonParsingError)
                    return
                }
                
                completion(currentWeather, nil)
            }
        }
        
        task.resume()
    }
    
}
