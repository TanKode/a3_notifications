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
* Type <STRING> (optional - default: user-color) type of this notification or the color name or the color as array/object
* Speed <INTEGER> (optional - default: 10) time in seconds to show this notification
* DisplaySide <STRING> (optional - default: left) left or right

**Examples**

```sqf
// default color on left side for 10 seconds
["TEXT"] call tankode_fnc_notification_system;

// success color on left side for 10 seconds
["TEXT", "success"] call tankode_fnc_notification_system;

// indigo color on left side for 5 seconds
["TEXT", "indigo", 5] call tankode_fnc_notification_system;

// blue grey color on right side for 15 seconds
["TEXT", "blue-grey", 15, "right"] call tankode_fnc_notification_system;
```