# A3L Notification System

A notification system for Arma 3 Life.

Es werden auch verschiedene Sounds, je nach Art der Meldung, abgespielt. Desweiteren kann man die Meldungen `slow` (15sek) oder `fast` (5sek) ausblenden lassen. Das Skript funktioniert mit allen Life Versionen, solange man die script_macros von 4.x einfügt:

In der `configuration.sqf` muss noch eine Zeile eingefügt werden: `life_open_notifications = [];`

## Usage

```
["TEXT",false,"fast"] call life_fnc_notification_system;
0: Text <STRING>
1: Type <BOOLEAN> false = noError true = Error
2: Speed <STRING> fast = fadeout nach 5 sek, slow = fadeout nach 15 sek
```
