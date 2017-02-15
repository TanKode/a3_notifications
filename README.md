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

### Parameters

* *_text* `string` *required* text to display in the notification
* *_type* `string` *optional - default: user-color* type of this notification or the color name or the color as array/object
* *_speed* `integer` *optional - default: 10* time in seconds to show this notification

### Examples

```sqf
// default color for 10 seconds
["This is my notfication text."] call tankode_fnc_notification_system;

// success color for 10 seconds
["This is my notfication text.", "success"] call tankode_fnc_notification_system;

// indigo color for 5 seconds
["This is my notfication text.", "indigo", 5] call tankode_fnc_notification_system;
```
