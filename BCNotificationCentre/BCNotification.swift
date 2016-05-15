//
//  BCNotification.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 08/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import Foundation

public struct BCNotification<T>: BCNamedNotification, BCValuedNotification {
    
    /// Name of the notification
    public let name: String
    
    /// Optional value of the notification
    public let value: T?
    
    public init(name: String, value: T? = nil) {
        self.name = name
        self.value = value
    }
    
}
