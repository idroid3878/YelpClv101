//
//  LocationViewModel.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-20.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation
struct LocationViewModel {
    private let currentLocation: LocationModel

    var latitude: Double {
        return currentLocation.latitude
    }
    
    var longitude: Double {
        return currentLocation.longitude
    }
    
    var radius: Int {
        return currentLocation.radius
    }
    
    init(loc: LocationModel) {
        self.currentLocation = loc
    }
}

struct LocationModelList {
    var locArray: [LocationViewModel?]
    var result: Bool
}
