#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

function Main( cParams )

   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg"
   
   SetTheme( "flick" )
   
   BuildMenu()

   if pcount() > 0
      Process( cParams )
      return nil
   endif

return nil

//----------------------------------------------------------------------------//

function BuildMenu()

   local AppName := AppName(), oMenu

   MENU oMenu
      MENUITEM "Test"
      MENU 
         MENUITEM "dialog" ACTION ( 'document.location = "' + AppName() + '?dlg1"' )
      ENDMENU

      MENUITEM "About"
      MENU 
         MENUITEM "My App..." ACTION MsgInfo( "My FiveWeb app" ) 
      ENDMENU
   ENDMENU

return oMenu

//----------------------------------------------------------------------------//

function Process( cParams )

   local aParams := hb_aTokens( cParams, ":" )
  
   do case
      case aParams[ 1 ] == "dlg1"
           MyDialog( aParams )
  endcase

return nil           

//----------------------------------------------------------------------------//

function MyDialog( aParams )

   local oDlg

   DEFINE DIALOG oDlg TITLE "Colin example" SIZE 600, 400

   @ 12, 10 SAY "Title:" OF oDlg

   @ 12, 80 SAY "..." OF oDlg

   @ 260, 250 BUTTON "Cancel" OF oDlg ACTION ( oDlg:End() )
   
   ACTIVATE DIALOG oDlg NOWAIT

return nil

//----------------------------------------------------------------------------//     