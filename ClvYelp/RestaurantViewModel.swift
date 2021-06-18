//
//  RestaurantViewModel.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: YelpRestaurant
    //private let rest: YelpRst

    var displayText: String {
        return restaurant.name?.capitalized ?? "" + " - " + (restaurant.displayphone!)
    }
    
    var name: String? {
        return restaurant.name //?? "UnknownName"
    }
    
    var address: [String]? {
        return restaurant.address
    }
    
    var displayphone: String? {
        return restaurant.displayphone
    }
    
    var imageurl: String? {
        return restaurant.imageurl
    }
    
    var review: Int {
        return restaurant.review
    }
    
    init(restaurant: YelpRestaurant) {
        self.restaurant = restaurant
        //self.rest = YelpRst(restaurantArray: self.restaurant, result: false)
    }
}

struct YelpRetrievedList {
    var restaurantArray: [RestaurantViewModel?]
    var result: Bool
}
