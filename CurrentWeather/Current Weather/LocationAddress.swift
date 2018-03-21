//
//  LocationAddress.swift
//  Current Weather
//
//  Created by Tania on 5/3/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation
import CoreLocation

class LocationAddress{    
    func getCoordinate(addressString : String,
                        completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                    
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
            
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
}
