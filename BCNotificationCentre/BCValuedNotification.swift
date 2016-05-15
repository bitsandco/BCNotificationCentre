//
//  BCValuedNotification.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 15/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import Foundation

public protocol BCValuedNotification {
    
    associatedtype T
    
    var value: T? { get }
    
}

extension NSNotification: BCValuedNotification {
    
    public var value: [NSObject : AnyObject]? {
        return userInfo
    }
    
}
