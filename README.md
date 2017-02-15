# A3 Notification System

A user notification system for ArmA 3 to replace `hint` and offer a bit more styling.

## Installation

**functions.hpp**
```
class Functions {
    file = "core\functions"; // adjust it to your setup
    class notification_system {};
};
```

## Usage

**Parameters**

* Text <STRING> text to display in the notification
* Type <STRING> type of this notification or the color name or the color as array/object
* Speed <INTEGER> time in seconds to show this notification

```
["TEXT","error",15] call notification_system;
["TEXT","success",5] call notification_system;
["TEXT","indigo",10] call notification_system;

// for life server
["TEXT","error",15] call life_fnc_notification_system;
```

> You have to adjust the function name depending on your mission setup.