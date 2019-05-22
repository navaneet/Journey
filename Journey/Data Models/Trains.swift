//
//  TrainPositions.swift
//  Journey
//
//  Created by Navaneet Sarma on 09/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

struct Trains: Codable {    
    let trainsArray: [Train]?
    
    enum CodingKeys: String, CodingKey {
        case trainsArray = "objTrainPositions"
    }
}
