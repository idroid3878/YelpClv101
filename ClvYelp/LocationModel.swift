//
//  LocationModel.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-20.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation

struct LocationModel {
    let latitude: Double
    let longitude: Double
    let radius: Int
}

struct LocationObj {
    var LocationModel: LocationModel
    var result: Bool
}
