//
//  BCNotification.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 08/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import Foundation

public struct BCNotification: BCNamedNotification {
    
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
    
}

extension BCNotification: Equatable { }

public func ==(lhs: BCNotification, rhs: BCNotification) -> Bool {
    return lhs.name == rhs.name
}
