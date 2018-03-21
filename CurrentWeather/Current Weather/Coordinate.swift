//
//  Coordinate.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation

struct Coordinate: CustomStringConvertible{
    var description: String{
        return "\(latitude),\(longitude)"
    }
    
    let latitude: Double
    let longitude: Double
    
    
}
