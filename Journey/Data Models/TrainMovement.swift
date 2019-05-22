//
//  TrainMovement.swift
//  Journey
//
//  Created by Navaneet Sarma on 10/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

struct TrainMovement: Codable {
    let trainCode: String
    let date: String
    let locationCode: String
    let locationName: String
    let locationOrder: Int
    let locationType: String
    let origin: String
    let destination: String
    let scheduledArrival: String
    let scheduledDeparture: String
    let expectedArrival: String
    let expectedDeparture: String
    let arrival: String?
    let departure: String?
    let autoArrival: Int?
    let autoDepart: Int?
    let stopType: String?
    
    enum CodingKeys: String, CodingKey {
        case trainCode = "TrainCode"
        case date = "TrainDate"
        case locationCode = "LocationCode"
        case locationName = "LocationFullName"
        case locationOrder = "LocationOrder"
        case locationType = "LocationType"
        case origin = "TrainOrigin"
        case destination = "TrainDestination"
        case scheduledArrival = "ScheduledArrival"
        case scheduledDeparture = "ScheduledDeparture"
        case expectedArrival = "ExpectedArrival"
        case expectedDeparture = "ExpectedDeparture"
        case arrival = "Arrival"
        case departure = "Departure"
        case autoArrival = "AutoArrival"
        case autoDepart = "AutoDepart"
        case stopType = "StopType"
    }
}
