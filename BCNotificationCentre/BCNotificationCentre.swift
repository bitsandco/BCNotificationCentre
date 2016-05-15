//
//  BCNotificationCentre.swift
//  BCNotificationCentre
//
//  Created by Romain Francez on 08/05/2016.
//  Copyright © 2016 Bits & Co. All rights reserved.
//

import Foundation

public class BCNotificationCentre {

    static let defaultCentre = BCNotificationCentre()
    
    private struct BCNotificationCentreObserver {
        let priority: BCNotificationCentrePriority
        let queue: NSOperationQueue?
        let observerBlock: Any
    }

    private var observers = [String: [BCNotificationCentreObserver]]()
    
    public init() { }
    
    /// Adds an observer block to a notification name and expecting
    /// a particular notification value type which will be
    /// triggered when a notification with this name and value type
    /// is posted.
    ///
    /// - Parameter name: the name of the notification to listen to
    /// - Parameter priority: the priority of the callback block
    /// - Parameter queue: unused
    /// - Parameter observerBlock: the block to be called when the 
    /// proper notification is posted
    ///
    /// - See: `postNotification`
    public func addObserverForName<T>(name: String, priority: BCNotificationCentrePriority = .Normal, queue: NSOperationQueue? = nil, observerBlock: (BCNotification<T>) -> Void) {
        if observers[name] == nil {
            observers[name] = [BCNotificationCentreObserver]()
        }
        observers[name]?.append(BCNotificationCentreObserver(priority: priority, queue: queue, observerBlock: observerBlock))
    }
    
    /// Posts a notification to all observers listening for this
    /// particular name and expecting this notification value
    /// type.
    ///
    /// The order in which the observer blocks are called are determined
    /// with the priority (a block with a higher priority will be called
    /// a block with a lower priority). However the order of calling blocks
    /// with the same priority is undetermined.
    ///
    /// Observers with the same name but a different value type will **not**
    /// be called.
    ///
    /// - Parameter notification: the notification to post to the observers
    public func postNotification<T where T: BCNamedNotification, T: BCValuedNotification>(notification: T) {
        let observersForName = observers[notification.name] ?? [BCNotificationCentreObserver]()
        observersForName.filter { (observer: BCNotificationCentreObserver) -> Bool in
            return (observer.observerBlock as? (T) -> Void) != nil
        }.sort({
            $0.priority >= $1.priority
        }).forEach({ (observer: BCNotificationCentreObserver) in
            if let observerBlock = (observer.observerBlock as? (T) -> Void) {
                observerBlock(notification)
            }
        })
    }
    
}
