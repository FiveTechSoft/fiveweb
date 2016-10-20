// A RAD for the web

#include "FiveWeb.ch"

static oServer

//----------------------------------------------------------------------------//

function Main()

   local oDlg
                                             // username         // password
   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   BuildMenu()

   DEFINE DIALOG oDlg SIZE 600, 400

   ACTIVATE DIALOG oDlg NOWAIT  

return nil

//----------------------------------------------------------------------------//

function BuildMenu()

   local oMenu

   MENU oMenu
      MENUITEM "FiveGen"
      MENU
         MENUITEM "Properties"
         MENUITEM "Go" 
      ENDMENU  
      
      MENUITEM "Interface"
      MENU 
         MENUITEM "Menu"
         MENUITEM "Forms"
         MENUITEM "Browses"
      ENDMENU

      MENUITEM "Rules"
      MENU 
         MENUITEM "Variables"
         MENUITEM "Scripts"  
      ENDMENU
         
      MENUITEM "Help"
      MENU 
         MENUITEM "Wiki..."  ACTION Go( "https://bitbucket.org/fivetech/fiveweb/wiki/Home" )
         MENUITEM "About..." ACTION MsgInfo( "FiveWeb RAD" )
      ENDMENU

   ENDMENU

return oMenu

//----------------------------------------------------------------------------//