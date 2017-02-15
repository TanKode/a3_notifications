/*
 File: fn_notification_system.sqf
 Author: TanKode
 Author-URI: https://github.com/TanKode
 License: MIT
 Parameter:
 0: Text <STRING> text to display in the notification
 1: Type <STRING> type of this notification or the colorname or the color as array/object
 2: Speed <INTEGER> time in seconds to show this notification
*/
params [
    ["_text","",[""],
    ["_type"],
    ["_speed",10,[10]]
];
if (isServer || !hasInterface) exitWith {};
if(isNil "open_notifications") then {
    open_notifications = [];
};
disableSerialization;
_display = findDisplay 46;

if(typeName _type === "ARRAY" || typeName _type === "OBJECT") then {
    _color = _type;
} else {
    switch (_type) do {
        case "error": {
            _colorName = "red";
        };
        case "warning": {
            _colorName = "amber";
        };
        case "success": {
            _colorName = "green";
        };
        case "info": {
            _colorName = "blue";
        };
        default {
            _colorName = _type;
        };
    };
    // https://material.io/guidelines/style/color.html
    switch (_colorName) do {
        case "red": {
            _color = [0.957,0.263,0.212,1];
        };
        case "pink": {
            _color = [0.914,0.118,0.388,1];
        };
        case "purple": {
            _color = [0.612,0.153,0.69,1];
        };
        case "deep-purple": {
            _color = [0.404,0.227,0.718,1];
        };
        case "indigo": {
            _color = [0.247,0.318,0.71,1];
        };
        case "blue": {
            _color = [0.129,0.588,0.953,1];
        };
        case "light-blue": {
            _color = [0.012,0.663,0.957,1];
        };
        case "cyan": {
            _color = [0,0.737,0.831,1];
        };
        case "teal": {
            _color = [0,0.588,0.533,1];
        };
        case "green": {
            _color = [0.298,0.686,0.314,1];
        };
        case "light-green": {
            _color = [0.545,0.765,0.29,1];
        };
        case "lime": {
            _color = [0.804,0.863,0.224,1];
        };
        case "yellow": {
            _color = [1,0.922,0.231,1];
        };
        case "amber": {
            _color = [1,0.757,0.027,1];
        };
        case "orange": {
            _color = [1,0.596,0,1];
        };
        case "deep-orange": {
            _color = [1,0.341,0.133,1];
        };
        case "brown": {
            _color = [0.475,0.333,0.282,1];
        };
        case "grey": {
            _color = [0.62,0.62,0.62,1];
        };
        case "blue-grey": {
            _color = [0.376,0.49,0.545,1];
        };
        default {
            _color = [(profileNamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profileNamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profileNamespace getvariable ['GUI_BCG_RGB_B',0.8862]),(profileNamespace getvariable ['GUI_BCG_RGB_A',0.7])];
        };
    };
};

if (_text isEqualType "") then {
    _text = parseText _text;
};
playSound "HintExpand";

_width = 0.2 * safezoneW;
_borderWidth = _width * 0.05;
_textWidth = _width * 0.95;
_height = 0.5;

_displaySide = "left"; // left or right
if(_displaySide == "left") then {
    _posX = 0.005;
    _posY = 0.01;
} else {
    _posX = safeZoneW + safeZoneX - 0.005 - _width;
    _posY = 0.01;
};

private _Border = _display ctrlCreate ["RscText", -1];
_Border ctrlSetPosition [_posX, _posY, _borderWidth, _height];
_Border ctrlSetBackgroundColor _color;
_Border ctrlSetFade 1;
_Border ctrlCommit 0;
_Border ctrlSetFade 0;
_Border ctrlCommit 0.4;

private _Text = _display ctrlCreate ["RscStructuredText", -1];
_Text ctrlSetStructuredText _text;
_Text ctrlSetPosition [_posX + _borderWidth, _posY, _textWidth, _height];
_adjustedHeight = ((ctrlTextHeight _Text) + (0.005 * safezoneH));
_Text ctrlSetPosition [_posX + _borderWidth, _posY, _textWidth, _adjustedHeight];
_Text ctrlCommit 0;
_Border ctrlSetPosition [_posX, _posY, _borderWidth, _adjustedHeight];
_Border ctrlCommit 0;
_Text ctrlSetBackgroundColor [0.129,0.129,0.129,1];
_Text ctrlSetFade 1;
_Text ctrlCommit 0;
_Text ctrlSetFade 0;
_Text ctrlCommit 0.4;

[_Text,_Border,_speed] spawn {
    disableSerialization;
    uiSleep _this select 2;
    private _Text = _this select 0;
    private _Border = _this select 1;
    _Text ctrlSetFade 1;
    _Text ctrlCommit 0.3;
    _Border ctrlSetFade 1;
    _Border ctrlCommit 0.3;
    uiSleep 0.3;
    ctrlDelete _Border;
    ctrlDelete _Text;
};

_offsetY = 0;
_marginY = 0.01 * safezoneH;
if (count open_notifications > 0) then {
    private _activeNotifications = 0;
    {
        private _ctrlBorder = _x select 0;
        private _ctrlText = _x select 1;
        if (!isNull _ctrlBorder && !isNull _ctrlText) then {
            _ctrlBorder ctrlSetPosition [_posX, _posY + _offsetY];
            _ctrlText ctrlSetPosition [_posX, _posY + _offsetY];
            _ctrlBorder ctrlCommit 0.25;
            _ctrlText ctrlCommit 0.25;
            _offsetY = _offsetY + _marginY + (ctrlPosition (_ctrlText)) select 3;
            if (_activeNotifications > 3) then {
                _ctrlText ctrlSetFade 1;
                _ctrlText ctrlCommit 0.2;
                _ctrlBorder ctrlSetFade 1;
                _ctrlBorder ctrlCommit 0.2;
            };
        };
        _activeNotifications = _activeNotifications + 1;
    } forEach open_notifications;
};
open_notifications = ([[_Border,_Text]] + open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};
