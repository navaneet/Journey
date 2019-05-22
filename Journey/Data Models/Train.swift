//
//  Train.swift
//  Journey
//
//  Created by Navaneet Sarma on 09/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

struct Train: Codable {
    let status: String
    let latitude: Double
    let longitude: Double
    let code: String
    let date: String
    let message: String
    let direction: String
    
    enum CodingKeys: String, CodingKey {
        case status = "TrainStatus"
        case latitude = "TrainLatitude"
        case longitude = "TrainLongitude"
        case code = "TrainCode"
        case date = "TrainDate"
        case message = "PublicMessage"
        case direction = "Direction"
    }
}
