//
//  NetworkUtility.swift
//  Journey
//
//  Created by Navaneet Sarma on 09/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation
import XMLParsing

class NetworkUtility {    
    /// Function that returns current trains available
    ///
    /// - Parameter completion: completion closure with results of the operation
    func getCurrentTrains(completion: @escaping ([Train]) -> ()) {
        let url = URLS.currentTrains.rawValue
        var result: [Train] = []
        fetchData(url: url) { (trains: Trains?) in
            if let trainsArray = trains?.trainsArray {
                result = trainsArray
            }
            
            completion(result)
        }
    }
    
    /// Function that provides train movement info based on date and train number provided
    ///
    /// - Parameters:
    ///   - trainID: the train ID
    ///   - date: the date for which to seek the data
    ///   - completion: completion closure with results of the operation
    func getMovementsForTrain(trainID: String, date: String, completion: @escaping ([TrainMovement]) -> ()) {
        let url = URLS.currentTrainMovements(trainID: trainID, date: date).rawValue
        var result: [TrainMovement] = []
        fetchData(url: url) { (trainMovements: TrainMovements?) in
            if let trainMovementsArray = trainMovements?.trainMovementsArray {
                result = trainMovementsArray
            }
            
            completion(result)
        }
    }
    
    /// Generic method to fetch data from the network, waits for the URLSession default timeout period when network is unavailable
    ///
    /// - Parameters:
    ///   - url: the url from which to fetch
    ///   - completion: completion closure with results of the operation
    private func fetchData<T: Codable>(url: URL, completion: @escaping (T?) -> ()) {
        print("Fetching data from \(url)")
        
        var result: T?
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            let status = (response as? HTTPURLResponse)?.statusCode
            if let data = data, let status = status, status == Constants.HTTP_STATUS_OK, error == nil {
                do {
                    let decoder = XMLDecoder()
                    result = try decoder.decode(T.self, from: data)
                } catch {
                    print(error)
                }
            }
            
            completion(result)
        }
        
        task.resume()
    }
}
