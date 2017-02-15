# A3 Notification System

A user notification system for ArmA 3 to replace `hint` and offer a bit more styling.

## Installation

Put the file `fn_notification_system.sqf` in your mission into `tankode/fn_notification_system.sqf` and register it in your `CfgFunctions`.

**Description.ext**
```cpp
class CfgFunctions
{
    class TanKode {
        tag = "tankode";
        file = "tankode";
        class notification_system {};
    };
};
```

## Usage

**Parameters**

* Text <STRING> text to display in the notification
* Type <STRING> type of this notification or the color name or the color as array/object
* Speed <INTEGER> time in seconds to show this notification

**Examples**

```sqf
["TEXT", "error", 15] call tankode_fnc_notification_system;
["TEXT", "success", 5] call tankode_fnc_notification_system;
["TEXT", "indigo", 10] call tankode_fnc_notification_system;
```