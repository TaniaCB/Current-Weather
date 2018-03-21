//
//  JSONDownloader.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation

class JSONDownloader{
    let session: URLSession
    
    convenience init(){
        self.init(configuration: URLSessionConfiguration.default)
    }
    
    init(configuration: URLSessionConfiguration){
        self.session = URLSession(configuration: configuration)
    }
    
    typealias JSON = [String:AnyObject]
    
    func jsonTask(request: URLRequest, completion: @escaping(JSON?, DarkSkyError?) -> Void) -> URLSessionTask{
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, DarkSkyError.requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200{
                if let data = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                        completion(json, nil)
                    }catch{
                        completion(nil, DarkSkyError.jsonConversionFailure)
                    }
                }else{
                    completion(nil, DarkSkyError.invalidData)
                }
            }else{
                completion(nil, DarkSkyError.responseUnsuccessfull)
            }
        }
        
        return task
    }
}
