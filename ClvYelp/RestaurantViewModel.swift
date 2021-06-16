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
    
    var displayText: String {
        return restaurant.name?.capitalized ?? "" + " - " + (restaurant.displayphone!)
    }
    
    init(restaurant: YelpRestaurant) {
        self.restaurant = restaurant
    }
}
