/*
 * Author: Pfc.Christiansen
 * per-class arsenal run on preinit, preloads preinit also. Reliant on XEH for the preinit
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * BOOL when finished
 *
 * Example(s):
 * Add to unit in editor: this setVariable ["class", "X", true];
 *
 *
 *
 * With XEH (preinit and preload,users wont have loadtime in arsenal):
 * Add to description.ext:
 *
 * Add to InitPlayerLocal.sqf:
 * [] execVM "fn_VA02.sqf";
 *
 *
 */

#include "config.sqf"

_class = player getVariable "class";
switch (_class) do {

    case "leader": {
      [lim_box,_STANDARD_WEAPONS + _GRENADIER_WEAPONS + _AT4,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;
      //:::::::::General Gear+Rolespecific Radio

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";

    };
    case "medic": {
      [lim_box,_STANDARD_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS + _MEDIC_ITEMS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;
      //:::::::::General Gear+Rolespecific Radio

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };
    case "grenadier": {
      [lim_box,_STANDARD_WEAPONS + _GRENADIER_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };
    case "marksman": {
      [lim_box,_STANDARD_WEAPONS + _MARKSMAN_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };
    case "autorifleman": {
      [lim_box,_AUTORIFLEMAN_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };
    case "mmg_gunner": {
      [lim_box,_MMG_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };
    case "pilot": {
      [lim_box,_STANDARD_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };
    case "mat_gunner": {
      [lim_box,_PILOT_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS + _MAT_LAUNCHERS,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };
    case "rifleman": {
        [lim_box,_STANDARD_WEAPONS + _AT4,false] call xla_fnc_addVirtualWeaponCargo;
        [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
        [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
        [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS,false] call xla_fnc_addVirtualItemCargo;
        ["Preload"] call xla_fnc_arsenal;

        player addItemToUniform "ACE_EarPlugs";
        player addItemToUniform "ACE_IR_Strobe_Item";
        player addItemToUniform "ACE_Flashlight_MX991";
        };
    case "FSG": {
      [lim_box,_STANDARD_WEAPONS,false] call xla_fnc_addVirtualWeaponCargo;
      [lim_box,_STANDARD_AMMO,false] call xla_fnc_addVirtualMagazineCargo;
      [lim_box,_STANDARD_BACKPACKS,false] call xla_fnc_addVirtualBackpackCargo;
      [lim_box,_STANDARD_ITEMS + _STANDARD_VESTS + _STANDARD_UNIFORMS + _STANDARD_HELMETS + _FSG_Launchers,false] call xla_fnc_addVirtualItemCargo;
      ["Preload"] call xla_fnc_arsenal;

      player addItemToUniform "ACE_EarPlugs";
      player addItemToUniform "ACE_IR_Strobe_Item";
      player addItemToUniform "ACE_Flashlight_MX991";
    };

};
_arsenalC = true;
_arsenalC
