_dialog = createDialog "playerRoster";
if (!_dialog) exitWith {systemChat "Error: Can't open 'Radio' dialog."};
[] call AW_fnc_roster;
