/*
_dialog = createDialog "playerRoster";
_giveYourControlAname = (findDisplay 1447) displayCtrl 1337;
_addThisToListBox = "Option";
_giveYourControlAname lbAdd _addThisToListBox;
*/

#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_SHORTCUTBUTTON 16
#define CT_XKEYDESC 40
#define CT_XBUTTON          41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_MENU 46 //Arma 3 (EDEN)
#define CT_MENU_STRIP 47 //Arma 3 (EDEN)
#define CT_CHECKBOX 77 //Arma 3
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_ANIMATED_USER 99
#define CT_MAP 100
#define CT_MAP_MAIN 101
#define CT_LISTNBOX 102
#define CT_ITEMSLOT         103
// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144 //tileH and tileW params required for tiled image
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           1024

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define FontM             "Zeppelin32" // The standard font in Arma 3 is "PuristaMedium"

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

class playerRoster {
  idd = 1447;
  movingEnable = false;
  controls[] = {listBox};

  class listBox
  		{
  			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
  			idc = 1337; // Control identification (without it, the control won't be displayed)
  			type = 5; // Type is 5
  			style = ST_LEFT + LB_TEXTURES; // Style
  			default = 0; // Control selected by default (only one within a display can be used)
  			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
/*
  			x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
  			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
  			w = 0.7; // Width
  			h = 0.4; // Height
*/
        x = 0.5 * safeZoneX;
        y = 0.5 * safeZoneY;
        w = 0.5 * safeZoneW;
        h = 0.5 * safeZoneH;
  			colorBackground[] = {0.2,0.2,0.2,0.7}; // Fill color
  			colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
  			colorSelectBackground2[] = {0,0,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)

  			sizeEx = 0.035; // Text size
  			font = "PuristaLight"; // Font from CfgFontFamilies
  			shadow = 1; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
  			colorText[] = {1,1,1,1}; // Text and frame color
  			colorDisabled[] = {1,1,1,0.5}; // Disabled text color
  			colorSelect[] = {1,1,1,1}; // Text selection color
  			colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
  			colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

  			pictureColor[] = {1,0.5,0,1}; // Picture color
  			pictureColorSelect[] = {1,1,1,1}; // Selected picture color
  			pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color

  			tooltip = "AW Roster Dialog"; // Tooltip text
  			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
  			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
  			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

  			period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

  			rowHeight = 1.5 * GUI_GRID_CENTER_H; // Row height
  			itemSpacing = 0; // Height of empty space between items
  			maxHistoryDelay = 1; // Time since last keyboard type search to reset it
  			canDrag = 1; // 1 (true) to allow item dragging

  			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

  			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
  			class ListScrollBar //In older games this class is "ScrollBar"
  			{
  				width = 0; // width of ListScrollBar
  				height = 0; // height of ListScrollBar
  				scrollSpeed = 0.01; // scroll speed of ListScrollBar

  				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
  				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
  				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
  				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

  				color[] = {1,1,1,1}; // Scrollbar color
  			};
        /*
  			onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
  			onDestroy = "systemChat str ['onDestroy',_this]; false";
  			onSetFocus = "systemChat str ['onSetFocus',_this]; false";
  			onKillFocus = "systemChat str ['onKillFocus',_this]; false";
  			onKeyDown = "systemChat str ['onKeyDown',_this]; false";
  			onKeyUp = "systemChat str ['onKeyUp',_this]; false";
  			onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
  			onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
  			onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
  			onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
  			onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
  			onMouseMoving = "";
  			onMouseHolding = "";

  			onLBSelChanged = "systemChat str ['onLBSelChanged',_this]; false";
  			onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";
  			onLBDrag = "systemChat str ['onLBDrag',_this]; false";
  			onLBDragging = "systemChat str ['onLBDragging',_this]; false";
  			onLBDrop = "systemChat str ['onLBDrop',_this]; false";
      */
  		};
};
