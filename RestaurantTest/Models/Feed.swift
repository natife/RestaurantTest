//
//  Feed.swift
//  RestaurantTest
//
//  Created by Natife on 5/20/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import Foundation

struct Feed: Codable
{
    let restaurant: String
    let foodName: String
    let price: Float
    let imageUrl: String
}
