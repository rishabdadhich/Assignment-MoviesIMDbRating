//
//  Singelton.swift
//  ST Ecommerce
//
//  Created by necixy on 15/07/20.
//  Copyright © 2020 Shashi. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

final class Singleton {
    static let shareInstance = Singleton()
    private init() {}
    
    var userCurrentCoordinates = CLLocationCoordinate2D()
    
    //address
    var country = ""
    var state = ""
    var city = ""
    var street = ""
    var streetNumber = ""
    var zip = ""
    var locationName = ""
    var streetAddress = ""
    
    
}
