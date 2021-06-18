//
//  RestaurantsListViewModel.swift
//  ClvYelp
//
//  Created by sonnguyen on 2021-06-16.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import Foundation

final class RestaurantsListViewModel {
    
    let title = "Restaurants"
    
    private let restaurant_Service: RestaurantServiceProtocol
    
    init( restaurantSrv: RestaurantServiceProtocol = RestaurantService()) {
      self.restaurant_Service = restaurantSrv
    }
    
    //init() {
    //    self.restaurant_Service = RestaurantService()
    //}
    
    //func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
    //    restaurantService.fetchRestaurants().map { $0.map {
    //        RestaurantViewModel(restaurant: $0)
    //        }}
    //}

    func fetchRestaurantViewModels(totalcount:Int, completion: @escaping (YelpRetrievedList) -> ()) {
        var restaurantVMArray = [RestaurantViewModel?]()
        var restaurantVMObj: YelpRetrievedList
        restaurantVMObj=YelpRetrievedList(restaurantArray: restaurantVMArray, result: false)
        
        let _: ()=restaurant_Service.fetchRestaurants(totalcount: 10,
                                                      searchterm: "Food",
                                                      city: "Toronto",
                                                      gpslat: 43.7605991,
                                                      gpslong: -79.3302248,
                                                      gpsradius: 2000,
                                                        opennow: true,
                                                        completion: {(restaurantlist) ->Void in
                
            let statuscode = restaurantlist.result
            if statuscode == true { // Got data from Yelp!
                for item in restaurantlist.restaurantArray {
                    restaurantVMArray.append( RestaurantViewModel(restaurant: item!))
                }
                restaurantVMObj=YelpRetrievedList(restaurantArray: restaurantVMArray, result: true)
                completion(restaurantVMObj)
            }
            else {
                restaurantVMObj=YelpRetrievedList(restaurantArray: [], result: false)
                completion(restaurantVMObj)
            }
        })
    }
}
