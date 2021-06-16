//
//  CDYelpKitManager.swift
//  iOS Example
//
//  Created by Christopher de Haan on 5/6/17.
//
//  Copyright © 2016-2021 Christopher de Haan <contact@christopherdehaan.me>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import CDYelpFusionKit
import UIKit

final class CDYelpFusionKitManager: NSObject {

    static let shared = CDYelpFusionKitManager()

    var apiClient: CDYelpAPIClient!

    func configure() {
        self.apiClient = CDYelpAPIClient(apiKey: "hR9Ev7jBqU53t8VUXF-z0OVKn9nUuFW1GfYn1jAQW9be-r3HDFaQWYCoh2az2bhj2Pqan2Fr0g1z6x_5U0AcyGdpq9fZyPA7jnxuBUqLei4dBe-pFHADhnYGA9DDYHYx")
    }
}
