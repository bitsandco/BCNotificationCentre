# BCNotificationCentre

Add observers and post notifications with priorities and typed values.

- [x] 📱 iOS 8.1+
- [x] 💻 Mac OS X 10.9+
- [x] ⌚️ watchOS 2.0+
- [x] 📺 tvOS 9.0+

## Installation

[![Version](https://img.shields.io/cocoapods/v/BCNotificationCentre.svg?style=flat)](http://cocoadocs.org/docsets/BCNotificationCentre)
[![Build Status](https://travis-ci.org/bitsandco/BCNotificationCentre.svg?branch=master)](https://travis-ci.org/bitsandco/BCNotificationCentre)

### CocoaPods

BCNotificationCentre is available through [CocoaPods](http://cocoapods.org).

    pod 'BCNotificationCentre'

## Quick start

**Add notification observer**

```swift
BCNotificationCentre.defaultCentre.addObserverForName("notificationName") { (notification: BCNotification<String>) -> Void in
  // Do something with the notification
}
```

**Post notification**

```swift
let notification = BCNotification(name: "notificationName", value: "the value associated")
BCNotificationCentre.defaultCentre.postNotification(notification)
```

## Typed notifications

Notifications are typed:

```swift
BCNotificationCentre.defaultCentre.addObserverForName("notificationName") { (notification: BCNotification<String>) -> Void in
  // Do something with the notification with the associated string value
}

BCNotificationCentre.defaultCentre.addObserverForName("notificationName") { (notification: BCNotification<Int>) -> Void in
  // Will not be called as the posted notification as an associated string value
}

let notification = BCNotification(name: "notificationName", value: "the value associated")
BCNotificationCentre.defaultCentre.postNotification(notification)
```

## Prioritised notifications

Notifications are prioritised:

```swift
BCNotificationCentre.defaultCentre.addObserverForName("notificationName", priority: .Low) { (notification: BCNotification<String>) -> Void in
  // This will be called after the normal priority notification
}

BCNotificationCentre.defaultCentre.addObserverForName("notificationName", priority: .Normal) { (notification: BCNotification<String>) -> Void in
  // This will be called first
}

let notification = BCNotification(name: "notificationName", value: "the value associated")
BCNotificationCentre.defaultCentre.postNotification(notification)
```

## License

BCNotificationCentre is available under the Apache License, Version 2.0. See the [LICENSE](LICENSE.md) file for more info.
