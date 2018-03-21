//
//  DarkSkyError.swift
//  Color Weather
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation

enum DarkSkyError: Error{
    case requestFailed
    case responseUnsuccessfull
    case invalidData
    case jsonConversionFailure
    case invalidURL
    case jsonParsingError
}
