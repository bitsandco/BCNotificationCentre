//
//  BCNotificationCentreTests.swift
//  BCNotificationCentreTests
//
//  Created by Romain Francez on 08/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import XCTest

@testable import BCNotificationCentre

class BCNotificationCentreTests: XCTestCase {
    
    private var sut: BCNotificationCentre!
    
    override func setUp() {
        super.setUp()
        
        sut = BCNotificationCentre()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPostNotification() {
        // Given
        let notificationName = "BCNotificationName"
        let notification = BCNotification<Any>(name: notificationName)
        
        // When
        sut.postNotification(notification)
        
        // Then
        // Expect nothing
    }
    
    func testAddObserverForNameAndRecieveNotification() {
        // Given
        let notificationName = "BCNotificationName"
        let notification = BCNotification<Any>(name: notificationName)
        var recievedNotification: BCNotification<Any>?
        let asyncNotificationExpectation = expectationWithDescription("asyncNotificationExpectation")
        let notificationBlock = { (notification: BCNotification<Any>) -> Void in
            recievedNotification = notification
            asyncNotificationExpectation.fulfill()
        }
        
        // When
        sut.addObserverForName(notificationName, observerBlock: notificationBlock)
        sut.postNotification(notification)
        
        // Then
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
            XCTAssertNotNil(recievedNotification)
            XCTAssertEqual(notification.name, recievedNotification?.name)
        }
    }
    
    func testAddObserverForNameWithPriorityAndRecieveNotification() {
        // Given
        let notificationName = "BCNotificationName"
        let notification = BCNotification<Any>(name: notificationName)
        var recievedNotification: BCNotification<Any>?
        let asyncNotificationExpectation = expectationWithDescription("asyncNotificationExpectation")
        let notificationBlock = { (notification: BCNotification<Any>) -> Void in
            recievedNotification = notification
            asyncNotificationExpectation.fulfill()
        }
        
        // When
        sut.addObserverForName(notificationName, priority: .Low, observerBlock: notificationBlock)
        sut.postNotification(notification)
        
        // Then
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
            XCTAssertNotNil(recievedNotification)
            XCTAssertEqual(notification.name, recievedNotification?.name)
        }
    }
    
    func testAddObserverForNameWithQueueAndRecieveNotification() {
        // Given
        let notificationName = "BCNotificationName"
        let notification = BCNotification<Any>(name: notificationName)
        var recievedNotification: BCNotification<Any>?
        let asyncNotificationExpectation = expectationWithDescription("asyncNotificationExpectation")
        let notificationBlock = { (notification: BCNotification<Any>) -> Void in
            recievedNotification = notification
            asyncNotificationExpectation.fulfill()
        }
        
        // When
        sut.addObserverForName(notificationName, queue: NSOperationQueue.mainQueue(),observerBlock: notificationBlock)
        sut.postNotification(notification)
        
        // Then
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
            XCTAssertNotNil(recievedNotification)
            XCTAssertEqual(notification.name, recievedNotification?.name)
        }
    }
    
    func testAddObserverForNameWithPriorityAndQueueAndRecieveNotification() {
        // Given
        let notificationName = "BCNotificationName"
        let notification = BCNotification<Any>(name: notificationName)
        var recievedNotification: BCNotification<Any>?
        let asyncNotificationExpectation = expectationWithDescription("asyncNotificationExpectation")
        let notificationBlock = { (notification: BCNotification<Any>) -> Void in
            recievedNotification = notification
            asyncNotificationExpectation.fulfill()
        }
        
        // When
        sut.addObserverForName(notificationName, priority: .High, queue: NSOperationQueue.mainQueue(), observerBlock: notificationBlock)
        sut.postNotification(notification)
        
        // Then
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
            XCTAssertNotNil(recievedNotification)
            XCTAssertEqual(notification.name, recievedNotification?.name)
        }
    }
    
    func testPriorityNotification() {
        // Given
        let notificationName = "BCNotificationName"
        let notification = BCNotification<Any>(name: notificationName)
        
        var recievedNotificationHighPriority: BCNotification<Any>?
        var recievedNotificationNormalPriority: BCNotification<Any>?
        var recievedNotificationLowPriority: BCNotification<Any>?
        
        let asyncNotificationHighPriorityExpectation = expectationWithDescription("asyncNotificationHighPriorityExpectation")
        let notificationHighPriorityBlock = { (notification: BCNotification<Any>) -> Void in
            XCTAssertNil(recievedNotificationNormalPriority)
            XCTAssertNil(recievedNotificationLowPriority)
            recievedNotificationHighPriority = notification
            asyncNotificationHighPriorityExpectation.fulfill()
        }
        
        let asyncNotificationNormalPriorityExpectation = expectationWithDescription("asyncNotificationNormalPriorityExpectation")
        let notificationNormalPriorityBlock = { (notification: BCNotification<Any>) -> Void in
            XCTAssertNotNil(recievedNotificationHighPriority)
            XCTAssertNil(recievedNotificationLowPriority)
            recievedNotificationNormalPriority = notification
            asyncNotificationNormalPriorityExpectation.fulfill()
        }
        
        
        let asyncNotificationLowPriorityExpectation = expectationWithDescription("asyncNotificationLowPriorityExpectation")
        let notificationLowPriorityBlock = { (notification: BCNotification<Any>) -> Void in
            XCTAssertNotNil(recievedNotificationHighPriority)
            XCTAssertNotNil(recievedNotificationNormalPriority)
            recievedNotificationLowPriority = notification
            asyncNotificationLowPriorityExpectation.fulfill()
        }
        
        // When
        sut.addObserverForName(notificationName, priority: .High, queue: NSOperationQueue.mainQueue(), observerBlock: notificationHighPriorityBlock)
        sut.addObserverForName(notificationName, priority: .Low, queue: NSOperationQueue.mainQueue(), observerBlock: notificationLowPriorityBlock)
        sut.addObserverForName(notificationName, priority: .Normal, queue: NSOperationQueue.mainQueue(), observerBlock: notificationNormalPriorityBlock)
        sut.postNotification(notification)
        
        // Then
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
            XCTAssertNotNil(recievedNotificationHighPriority)
            XCTAssertNotNil(recievedNotificationLowPriority)
            XCTAssertEqual(notification.name, recievedNotificationHighPriority?.name)
            XCTAssertEqual(recievedNotificationHighPriority?.name, recievedNotificationNormalPriority?.name)
            XCTAssertEqual(recievedNotificationHighPriority?.name, recievedNotificationLowPriority?.name)
        }
    }
    
    func testTypedNotifications() {
        // Given
        let notificationName = "BCNotificationName"
        let notification = BCNotification(name: notificationName, value: 1)
        
        let asyncNotificationExpectation = expectationWithDescription("asyncNotificationExpectation")
        
        var recievedGoodTypedNotification: BCNotification<Int>?
        let goodTypedNotificationBlock = { (notification: BCNotification<Int>) -> Void in
            recievedGoodTypedNotification = notification
            asyncNotificationExpectation.fulfill()
        }
        
        var recievedBadTypedNotification: BCNotification<String>?
        let badTypedNotificationBlock = { (notification: BCNotification<String>) -> Void in
            recievedBadTypedNotification = notification
            asyncNotificationExpectation.fulfill()
        }
        
        // When
        sut.addObserverForName(notificationName, priority: .Low, observerBlock: goodTypedNotificationBlock)
        sut.addObserverForName(notificationName, priority: .High, observerBlock: badTypedNotificationBlock)
        sut.postNotification(notification)
        
        // Then
        waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
            XCTAssertNotNil(recievedGoodTypedNotification)
            XCTAssertNil(recievedBadTypedNotification)
            XCTAssertEqual(notification.name, recievedGoodTypedNotification?.name)
            XCTAssertEqual(notification.value, recievedGoodTypedNotification?.value)
        }
    }
    
    func testDefaultCentre() {
        let sut = BCNotificationCentre.defaultCentre
        XCTAssertEqual(ObjectIdentifier(BCNotificationCentre.defaultCentre), ObjectIdentifier(sut))
        XCTAssertNotEqual(ObjectIdentifier(BCNotificationCentre()), ObjectIdentifier(sut))
    }
    
}
