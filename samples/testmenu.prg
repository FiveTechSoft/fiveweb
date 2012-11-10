#include "FiveWeb.ch"

function Main()

   BuildMenu()

return nil

function BuildMenu()

   local oMenu

   MENU oMenu
      MENUITEM "Your app"
      MENU
         MENUITEM "About..." ACTION MsgInfo( "My app" )
         MENUITEM "Quit"
      ENDMENU 
      
      MENUITEM "Files"
      
      MENUITEM "Reports"
      MENU 
         MENUITEM "Clients"
         MENU
            MENUITEM "List"
            MENUITEM "By Last name" 
            MENUITEM "By State" 
         ENDMENU
         
         MENUITEM "Stock"
      ENDMENU
      
      MENUITEM "Utilities"
      
      MENUITEM "Help"
      MENU
         MENUITEM "Wiki"
      ENDMENU
   ENDMENU

return nil