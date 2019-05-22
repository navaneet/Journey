//
//  DetailsViewController.swift
//  Journey
//
//  Created by Navaneet Sarma on 10/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit
import Eureka

class DetailsViewController: FormViewController {
    private var trainMovements: [TrainMovement] = []
    private var train: Train
    
    init(_ train: Train) {
        self.train = train
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Stations For \(train.code)"
        createDynamicForm()
    }
    
    private func createDynamicForm() {
        NetworkUtility().getMovementsForTrain(trainID: train.code, date: train.date) { [weak self] (trainMovements) in
            DispatchQueue.main.async {
                UIView.performWithoutAnimation {
                    if let self = self {
                        self.trainMovements = trainMovements
                        
                        if !trainMovements.isEmpty {
                            for trainMovement in trainMovements {
                                let section = Section()
                                self.form
                                    +++ section
                                    <<< LabelRow() {
                                        $0.title = "❨\(trainMovement.locationOrder)❩  \(trainMovement.locationName)"
                                    }
                                    <<< LabelRow() {
                                        $0.title = "Scheduled Arrival"
                                        $0.value = trainMovement.scheduledDeparture
                                    }
                                    <<< LabelRow() {
                                        $0.title = "Expected Arrival"
                                        $0.value = trainMovement.expectedArrival
                                    }
                                    <<< LabelRow() {
                                        $0.title = "Actual Arrival"
                                        if let arrival = trainMovement.arrival {
                                            $0.value = arrival
                                        } else {
                                            $0.value = "Waiting"
                                        }
                                }
                            } 
                        } else {
                            self.showDataAlert(nil)
                        }
                    }
                }
            }
        }
    }
}
