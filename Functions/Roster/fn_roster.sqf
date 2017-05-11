/*
 * Author: [Pfc.Christiansen]
 * [Inspired by Ryko's roster,simplified by me and added a listbox dialog to make it easier for players with low resouloutions to view]
 *
 * Arguments:
 * 0: Argument Name <TYPE>
 *
 * Return Value:
 * Return Name <TYPE>
 *
 * Example:
 * ["example"] call ace_[module]_fnc_[functionName]
 *
 * Public: [Yes/No]
 */
 disableSerialization;
 _ctrl = (findDisplay 1447) displayCtrl 1337;
 _players = [];
 _list = [];
 {_players pushBack _x} forEach (playableUnits - entities "HeadlessClient_F");
 {_return = format [":::%1:::%2:::%3:::%4:::", groupId (group _x),roleDescription _x, rank _x, name _x];_ctrl lbAdd _return} forEach _players;
 lbSort [_ctrl, "ASC"];
