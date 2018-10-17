//
//  Model.swift
//  d05
//
//  Created by Malebo MTHOMBENI on 2018/10/09.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import Foundation
import CoreLocation

struct placeData {
    static let placeList: [(String, String, CLLocationCoordinate2D)] = [
        ("Home", "Ebony Park, Midrand",CLLocationCoordinate2D(latitude: -25.996162, longitude: 28.185229)),
        ("42","Boulevard Bessières,Paris", CLLocationCoordinate2D(latitude: 48.896601, longitude: 2.318501)),
        ("WeThinkCode", "Albertina Sisulu Rd,Johannesburg",CLLocationCoordinate2D(latitude: -26.204717, longitude: 28.040170)),
        ("Dance Studio", "Helen Joseph St, Newtown, Johannesburg",CLLocationCoordinate2D(latitude: -26.203398, longitude: 28.031447))
    ]
}
