// A RAD for the web

#include "FiveWeb.ch"

static oServer

//----------------------------------------------------------------------------//

function Main( cParams )

   local aParams := If( cParams != nil, hb_aTokens( cParams, ":" ), nil )
   local cParam := If( aParams != nil, aParams[ 1 ], "" )

   SET BACKIMAGE TO "https://bitbucket.org/fivetech/screenshots/downloads/office.bmp"
   
   do case
      case cParam == "menu"
           Browse( "menu" )

      case cParam == "forms"
           Browse( "forms" )

      case cParam == "browses"
           Browse( "browses" )

      case cParam == "browses"
           Browse( "browses" )

      case cParam == "vars"
           Browse( "vars" )

      case cParam == "scripts"
           Browse( "scripts" )

   endcase

   BuildMenu()

return nil

//----------------------------------------------------------------------------//

function Browse( cTableName )

   local oDlg
                                             // username         // password
   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   oServer:SelectDB( "fivetech_fivegen" ) 

   DEFINE DIALOG oDlg SIZE 980, 665 TITLE "Browse: " + cTableName
   
   @ 0, 0 BROWSE oBrw SIZE 965, 570 OF oDlg ;
      ARRAY oServer:Query( "SELECT * FROM " + cTableName )

   @ 555, 10 BUTTON "Add" OF oDlg SIZE 110, 40 ACTION MsgInfo( "Add" )

   @ 555, 150 BUTTON "Edit" OF oDlg SIZE 110, 40 ACTION MsgInfo( "Edit" )

   @ 555, 290 BUTTON "Del" OF oDlg SIZE 110, 40 ACTION MsgInfo( "Delete" )

   @ 555, 430 BUTTON "Search" OF oDlg SIZE 110, 40 ACTION MsgInfo( "Search" )
 
   @ 555, 570 BUTTON "Query" OF oDlg SIZE 110, 40 ACTION MsgInfo( "Query" )

   @ 555, 710 BUTTON "Print" OF oDlg SIZE 110, 40 ACTION MsgInfo( "Print" )

   @ 555, 850 BUTTON "Close" OF oDlg SIZE 110, 40 ACTION oDlg.End()

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
         MENUITEM "Menu"    ACTION ( 'document.location = "' + appname() + '?menu"' )
         MENUITEM "Forms"   ACTION ( 'document.location = "' + appname() + '?forms"' )
         MENUITEM "Browses" ACTION ( 'document.location = "' + appname() + '?browses"' )
      ENDMENU

      MENUITEM "Rules"
      MENU 
         MENUITEM "Variables" ACTION ( 'document.location = "' + appname() + '?vars"' )
         MENUITEM "Scripts"   ACTION ( 'document.location = "' + appname() + '?scripts"' )
      ENDMENU
         
      MENUITEM "Help"
      MENU 
         MENUITEM "Wiki..."  ACTION Go( "https://bitbucket.org/fivetech/fiveweb/wiki/Home" )
         MENUITEM "About..." ACTION MsgInfo( "FiveWeb RAD" )
      ENDMENU

   ENDMENU

return oMenu

//----------------------------------------------------------------------------//