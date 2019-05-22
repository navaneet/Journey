//
//  UIAlertController.swift
//  Journey
//
//  Created by Navaneet Sarma on 10/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Shows network alert error
    func showNetworkAlert(_ completion: (() -> ())?) {
        let alert = UIAlertController(title: "Error", message: "Network Unavailable", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            completion?()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    /// Show no train data available alert
    func showDataAlert(_ completion: (() -> ())?) {
        let alert = UIAlertController(title: "Sorry!", message: "No Train Data Available At This Time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            completion?()
        }))
        present(alert, animated: true, completion: nil)
    }
}
