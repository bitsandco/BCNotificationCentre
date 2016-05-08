//
//  BCNotificationCentrePriority.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 08/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import Foundation

public enum BCNotificationCentrePriority: Int {
    case Low = -4
    case Normal = 0
    case High = 4
}

extension BCNotificationCentrePriority: Comparable { }

public func <(lhs: BCNotificationCentrePriority, rhs: BCNotificationCentrePriority) -> Bool {
    return lhs.rawValue < rhs.rawValue
}
