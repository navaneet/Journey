//
//  TrainExtension.swift
//  Journey
//
//  Created by Navaneet Sarma on 10/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation
import UIKit

extension Train {
    /// Creates an attributed string to display if train is currently running or not
    ///
    /// - Returns: the resultant attributed string with the status indicator
    func getAttributedString() -> NSMutableAttributedString {
        let  indicatorString = "●" + " " + self.direction + " " + self.date
        let color: UIColor = self.status == TrainStatus.NOT_RUNNING.rawValue ? UIColor.ORANGE : UIColor.GREEN
        let attributedString: NSMutableAttributedString =  NSMutableAttributedString(string: indicatorString)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: color,
                                      range: NSRange(location:0, length: 1))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: UIColor.darkGray,
                                      range: NSRange(location:2, length: self.direction.count))
        return attributedString
    }
}
