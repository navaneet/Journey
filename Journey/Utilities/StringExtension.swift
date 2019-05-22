//
//  StringExtension.swift
//  Journey
//
//  Created by Navaneet Sarma on 09/05/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

extension String {
    /// Replaces line breaks with actual ones, \\n with \n
    ///
    /// - Returns: the corrected string with line breaks
    func replaceLineBreaks() -> String {
        return self.replacingOccurrences(of: "\\n", with: "\n")
    }
    
    /// Function that makes a URL safe string, replaces unwanted characters like whitespaces etc.
    ///
    /// - Returns: the URL safe string
    func urlSafeString() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed ) ?? ""
    }
}
