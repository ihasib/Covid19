//
//  Extension.swift
//  Covid19_Stat
//
//  Created by S. M. Hasibur Rahman on 5/12/20.
//  Copyright © 2020 S. M. Hasibur Rahman. All rights reserved.
//

import Foundation

extension Int64 {
    func getFormattedString() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        return formatter.string(from: NSNumber(value: self)) ?? "Failed"
    }
}
