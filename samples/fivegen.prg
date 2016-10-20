// A RAD for the web

#include "FiveWeb.ch"

static oServer

//----------------------------------------------------------------------------//

function Main()

   local oDlg, oBrw
                                             // username         // password
   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   oServer:SelectDB( "fivetech_fivegen" ) 

   BuildMenu()

   Browse( "menu" )

return nil

//----------------------------------------------------------------------------//

function Browse( cTableName )

   DEFINE DIALOG oDlg SIZE 1200, 600 TITLE "Browse: " + cTableName
   
   @ 10, 10 BROWSE oBrw SIZE 1190, 500 OF oDlg ;
      ARRAY oServer:Query( "SELECT * FROM " + cTableName )

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
         MENUITEM "Menu" ACTION ( 'document.location = "' + appname() + '?browse_menu"' )
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