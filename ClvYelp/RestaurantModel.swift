//
//  RestaurantModel.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation
import CDYelpFusionKit

struct YelpRestaurant {
    let review: Int
    let imageurl: String?
    let name: String?
    let address: [String]?

    let displayphone: String?
}

struct YelpRst {
    var restaurantArray: [YelpRestaurant?]
    var result: Bool
}
