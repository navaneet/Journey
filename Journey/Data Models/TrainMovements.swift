//
//  TrainMovements.swift
//  Journey
//
//  Created by Navaneet Sarma on 10/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

struct TrainMovements: Codable {
    let trainMovementsArray: [TrainMovement]
    
    enum CodingKeys: String, CodingKey {
        case trainMovementsArray = "objTrainMovements"
    }
}
