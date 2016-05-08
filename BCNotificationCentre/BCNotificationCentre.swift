//
//  BCNotificationCentre.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 08/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import Foundation

public class BCNotificationCentre {
    
    private struct BCNotificationCentreObserver {
        let priority: BCNotificationCentrePriority
        let queue: NSOperationQueue?
        let observerBlock: (BCNotification) -> Void
    }
    
    private var observers = [String: [BCNotificationCentreObserver]]()
    
    public func addObserverForName(name: String, priority: BCNotificationCentrePriority = .Normal, queue: NSOperationQueue? = nil, observerBlock: (BCNotification) -> Void) {
        
        if observers[name] == nil {
            observers[name] = [BCNotificationCentreObserver]()
        }
        observers[name]?.append(BCNotificationCentreObserver(priority: priority, queue: queue, observerBlock: observerBlock))
    }
    
    public func postNotification(notification: BCNamedNotification) {
        if let notification = notification as? BCNotification {
            let observersForName = observers[notification.name] ?? [BCNotificationCentreObserver]()
            observersForName.sort({
                $0.priority >= $1.priority
            }).forEach({ (observer: BCNotificationCentre.BCNotificationCentreObserver) in
                observer.observerBlock(notification)
            })
        }
    }
    
}
