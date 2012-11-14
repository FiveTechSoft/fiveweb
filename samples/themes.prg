#include "FiveWeb.ch"

function Main()

   local oDlg, oFld

   BuildMenu()

   DEFINE DIALOG oDlg SIZE 600, 400

   @ 10, 10 FOLDER oFld PROMPTS "One", "Two", "Three" OF oDlg ;
      SIZE 520, 230

   @ 260, 150 BUTTON "Ok" OF oDlg ACTION MsgInfo( "ok" )

   @ 260, 300 BUTTON "Cancel" OF oDlg ACTION MsgInfo( "cancel" )

   ACTIVATE DIALOG oDlg NOWAIT  

return nil

function BuildMenu()

   local oMenu

   MENU oMenu
      MENUITEM "Main theme"
      MENU
         MENUITEM "Light"
         MENU 
            MENUITEM "Aristo"       ACTION SetAristoTheme()
            MENUITEM "Base"         ACTION SetTheme( "base" )
            MENUITEM "Black-tie"    ACTION SetTheme( "black-tie" )
            MENUITEM "Blitzer"      ACTION SetTheme( "blitzer" )
            MENUITEM "Cupertino"    ACTION SetTheme( "cupertino" )
            MENUITEM "excite-bike"  ACTION SetTheme( "excite-bike" )
            MENUITEM "flick"        ACTION SetTheme( "flick" )
            MENUITEM "hot-sneacks"  ACTION SetTheme( "hot-sneaks" )
            MENUITEM "humanity"     ACTION SetTheme( "humanity" )
            MENUITEM "overcast"     ACTION SetTheme( "overcast" )
            MENUITEM "pepper-grinder" ACTION SetTheme( "pepper-grinder" )
            MENUITEM "redmond"      ACTION SetTheme( "redmond" )
            MENUITEM "smoothness"   ACTION SetTheme( "smoothness" )
            MENUITEM "south-street" ACTION SetTheme( "south-street" )
            MENUITEM "start"        ACTION SetTheme( "start" )
            MENUITEM "sunny"        ACTION SetTheme( "sunny" )
            MENUITEM "ui-lightness" ACTION SetTheme( "ui-lightness" )
         ENDMENU
         
         MENUITEM "Dark"
         MENU 
            MENUITEM "Dot-lub"      ACTION SetTheme( "dot-luv" )
            MENUITEM "Dark-hive"    ACTION SetTheme( "dark-hive" )
            MENUITEM "Eggplant"     ACTION SetTheme( "eggplant" )
            MENUITEM "le-frog"      ACTION SetTheme( "le-frog" )
            MENUITEM "mint-choc"    ACTION SetTheme( "mint-choc" )
            MENUITEM "swanky-purse" ACTION SetTheme( "swanky-purse" )
            MENUITEM "trontastic"   ACTION SetTheme( "trontastic" )
            MENUITEM "ui-darkness"  ACTION SetTheme( "ui-darkness" )
            MENUITEM "vader"        ACTION SetTheme( "vader" )
         ENDMENU
      ENDMENU  
   ENDMENU

return oMenu