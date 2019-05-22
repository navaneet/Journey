//
//  Constants.swift
//  Journey
//
//  Created by Navaneet Sarma on 09/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

class Constants {
    static let baseUrl = "http://api.irishrail.ie/realtime/realtime.asmx/"
    static let HTTP_STATUS_OK = 200
}

enum URLS {
    case currentTrains, currentTrainMovements(trainID: String, date: String)
    var rawValue: URL {
        get {
            switch self {
            case .currentTrains:
                return URL(string: Constants.baseUrl + "getCurrentTrainsXML")!
            case .currentTrainMovements(trainID: let trainID, date: let date):
                return URL(string: Constants.baseUrl + "getTrainMovementsXML?TrainId=\(trainID)&TrainDate=\(date.urlSafeString())")!
            }
        }
    }
}

enum TrainStatus: String {
    case NOT_RUNNING = "N"
    case RUNNING = "R"
}

