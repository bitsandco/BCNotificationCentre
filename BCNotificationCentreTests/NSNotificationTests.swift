//
//  NSNotificationTests.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 15/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import XCTest

class NSNotificationTests: XCTestCase {
    
    func testValue() {
        let userInfo = [NSObject: AnyObject]()
        let notification = NSNotification(name: "", object: nil, userInfo: userInfo)
        XCTAssertNotNil(notification.value)
        XCTAssertEqual(ObjectIdentifier(userInfo), ObjectIdentifier(notification.value!))
    }
    
}
