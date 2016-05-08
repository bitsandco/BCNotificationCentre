//
//  BCNamedNotification.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 08/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import Foundation

public protocol BCNamedNotification {
    
    var name: String { get }
    
}

extension NSNotification: BCNamedNotification { }
