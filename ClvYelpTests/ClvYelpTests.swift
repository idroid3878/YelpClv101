//
//  ClvYelpTests.swift
//  ClvYelpTests
//
//  Created by sonnguyen on 2021-06-14.
//  Copyright © 2021 sonnguyen. All rights reserved.
//

import XCTest
@testable import ClvYelp
@testable import CDYelpFusionKit

class ClvYelpTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testClvYelpSuccessfulDownload() throws {
        let restaurant_Service: RestaurantServiceProtocol
        restaurant_Service = RestaurantService()
        //var viewModel: RestaurantsListViewModel!
        var statcode: Bool = false
        var counted_record_downloaded: Int = 0
        
        let exp = expectation(description: "Check Login is successful")
        
        let _: ()=restaurant_Service.fetchRestaurants(totalcount: 10,
                                                      searchterm: "Food",
                                                      city: "Toronto",
                                                      gpslat: 43.7605991,
                                                      gpslong: -79.3302248,
                                                      gpsradius: 2000,
                                                        opennow: true,
                                                        completion: {(restaurantlist) ->Void in
                
            exp.fulfill()
                                                            
            let statuscode = restaurantlist.result
            statcode = restaurantlist.result
            counted_record_downloaded = restaurantlist.restaurantArray.count

                //if statuscode == true {
                //let restarray = restaurantlist.restaurantArray
                
                //for item in restarray {
                    //print("\(item?.name) \(item?.displayphone)") //\(item.location?.addressOne)")
                //}
                //}
        })
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(statcode, true)
        }
    }
    
    // Should download 10 records fro Yelp
    func testClvYelpDownloadedRecords() throws {
        let restaurant_Service: RestaurantServiceProtocol
        restaurant_Service = RestaurantService()
        //var viewModel: RestaurantsListViewModel!
        var counted_record_downloaded: Int = 0
        
        let exp = expectation(description: "Check Login is successful")
        
        let _: ()=restaurant_Service.fetchRestaurants(totalcount: 10,
                                                      searchterm: "Food",
                                                      city: "Toronto",
                                                      gpslat: 43.7605991,
                                                      gpslong: -79.3302248,
                                                      gpsradius: 2000,
                                                        opennow: true,
                                                        completion: {(restaurantlist) ->Void in
                
            exp.fulfill()
                                                            
            counted_record_downloaded = restaurantlist.restaurantArray.count

                //if statuscode == true {
                //let restarray = restaurantlist.restaurantArray
                
                //for item in restarray {
                    //print("\(item?.name) \(item?.displayphone)") //\(item.location?.addressOne)")
                //}
                //}
        })
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(counted_record_downloaded, 100)
        }
    }
}
