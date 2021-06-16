//
//  RestaurantService.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation

protocol RestaurantServiceProtocol {
    func fetchRestaurants(totalcount: Int, searchterm: String, city: String, gpslat: Double, gpslong: Double, gpsradius: Int, opennow: Bool, completion: @escaping (YelpRst) -> ())
}

class RestaurantService: RestaurantServiceProtocol {

    func fetchRestaurants(totalcount: Int, searchterm: String, city: String,
                           gpslat: Double, gpslong: Double, gpsradius: Int,
                           opennow: Bool, completion: @escaping (YelpRst) -> ()) {

        var restaurantArray = [YelpRestaurant?]()
        var restaurantObj:YelpRst
        restaurantObj=YelpRst(restaurantArray: restaurantArray, result: false)
        
        CDYelpFusionKitManager.shared.apiClient.cancelAllPendingAPIRequests()
        CDYelpFusionKitManager.shared.apiClient.searchBusinesses(
            byTerm: searchterm, //"Food", // what kind of business to search
            location: city, //"Toronto", // which city is it in
             latitude: gpslat, // 43.7605991, // exact gps coordinate
             longitude:gpslong, //-79.3302248,
             radius: gpsradius, //2000, // distance from gps coord in meters
             categories: nil,
             locale: .english_unitedStates,
             limit: totalcount , //10,
             offset: 0,
             sortBy: .rating,
             priceTiers: nil,
             openNow: false, // is it currently open? Sunday night?
             openAt: nil,
             attributes: nil) { (response) in

                if let response = response,
                    let businesses = response.businesses,
                    businesses.count > 0
                {
                    for item in businesses {
                        restaurantArray.append(YelpRestaurant(review: item.reviewCount!,
                                                              imageurl: item.imageUrl!,
                                                              name: item.name!,
                                                              address: item.location?.displayAddress! ?? [],
                                                              displayphone: item.displayPhone!
                        ))
                    }
                    
                    /*
                     struct YelpRestaurant {
                         let review: Int
                         let imageurl: String
                         let name: String
                         let location: CDYelpLocation

                         let displayphone: String
                     }
                     
                     */
                    restaurantObj.restaurantArray=restaurantArray
                    restaurantObj.result=true
                    completion(restaurantObj)
                }
                else {
                    restaurantObj.result=false
                    restaurantObj.restaurantArray=[]
                    completion(restaurantObj)
                }
        }
    }
}
