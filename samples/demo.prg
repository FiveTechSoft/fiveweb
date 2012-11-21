#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

function Main( cParam )

   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/bubbles.jpg"
   
   @  80, 80 SAY "Pulldown Menu" URL hb_argv( 0 ) + "?pdmenu"

   @ 140, 80 SAY "Dialog" URL hb_argv( 0 ) + "?dialog"

   do case
      case cParam == "pdmenu"
           BuildMenu()
           
      case cParam == "dialog"
           BuildDialog()
   endcase        

return nil

//----------------------------------------------------------------------------//

function BuildMenu()

   local oMenu
   
   MENU oMenu
      MENUITEM "Info"
      MENU
         MENUITEM "About..." ACTION MsgInfo( "FiveWeb power" ) 
      ENDMENU
      
      MENUITEM "Files"
      MENU
         MENUITEM "Clients"
         MENUITEM "Stock" 
      ENDMENU
      
      MENUITEM "Reports"
      
      MENUITEM "Help" 
   ENDMENU
   
return nil

//----------------------------------------------------------------------------//

function BuildDialog()

   local oDlg
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb"
   
   ACTIVATE DIALOG oDlg NOWAIT
   
return nil      

//----------------------------------------------------------------------------//
