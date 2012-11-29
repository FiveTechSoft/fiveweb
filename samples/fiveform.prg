#include "FiveWeb.ch"

function Main()

   local oDlg

   BuildMenu()

   DEFINE DIALOG oDlg SIZE 600, 400

   ACTIVATE DIALOG oDlg NOWAIT  

return nil

function BuildMenu()

   local oMenu

   MENU oMenu
      MENUITEM "Controls"
      MENU
         MENUITEM "Add control"
         MENU 
            MENUITEM "Say"      ACTION AddSay( "oDlg" )
            MENUITEM "Get"      ACTION AddGet( "oDlg" )
            MENUITEM "Button"   ACTION AddButton( "oDlg" )
            MENUITEM "Progress" ACTION AddProgress( "oDlg" )
         ENDMENU
      ENDMENU  
      
      MENUITEM "Source"
      MENU 
         MENUITEM "FiveWeb" ACTION GenCode( "oDlg" )
         MENUITEM "HTML"    ACTION ShowHTML( "oDlg" )
      ENDMENU

      MENUITEM "Help"
      MENU 
         MENUITEM "About..." ACTION MsgInfo( "FiveWeb forms designer" )
      ENDMENU

   ENDMENU

return oMenu