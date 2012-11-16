#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

function Main( cParams )

   local oDlg, oGet1, oGet2, oGet3 
   local cTitle := Space( 80 ), cFamilien := Space( 80 ), cVorname := Space( 80 )
   
   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg"
   
   SetTheme( "flick" )
   
   BuildMenu()

   if pcount() > 0
      Process( cParams )
      return nil
   endif

   DEFINE DIALOG oDlg TITLE "Otto example" SIZE 600, 400
   
   @ 12, 10 SAY "Title:" OF oDlg

   @ 10, 160 GET oGet1 VAR cTitle OF oDlg SIZE 300, 35

   @ 54, 10 SAY "FamilienName:" OF oDlg

   @ 52, 160 GET oGet2 VAR cFamilien OF oDlg SIZE 300, 35

   @ 94, 10 SAY "Vorname:" OF oDlg

   @ 90, 160 GET oGet3 VAR cVorname OF oDlg SIZE 300, 35

   @ 260, 160 BUTTON "Ok" OF oDlg ;
      ACTION document.location = "otto.exe?add:" + ;
                                 document.getElementById( "oGet1" ).value + ":" + ;
                                 document.getElementById( "oGet2" ).value + ":" + ;
                                 document.getElementById( "oGet3" ).value

   @ 260, 300 BUTTON "Cancel" OF oDlg

   ACTIVATE DIALOG oDlg NOWAIT

return nil

//----------------------------------------------------------------------------//

function BuildMenu()

   local oMenu

   MENU oMenu
      MENUITEM "Clients"
      MENU 
         MENUITEM "Add"    ACTION document.location = "otto.exe"
         MENUITEM "Browse" ACTION document.location = "otto.exe?browse"
      ENDMENU

      MENUITEM "About"
      MENU 
         MENUITEM "Wiki"
      ENDMENU
   ENDMENU

return oMenu

//----------------------------------------------------------------------------//

function Process( cParams )

   local aParams := hb_aTokens( cParams, ":" )
   
   do case
      case aParams[ 1 ] == "add"
           Add( aParams )

      case aParams[ 1 ] == "browse"
           Browse()
           
   endcase
   
return nil           

//----------------------------------------------------------------------------//

function Add( aParams )

   if ! File( "clients.dbf" )
      DbCreate( "clients.dbf", { { "title",   "C", 10, 0 },;
                                 { "family",  "C", 80, 0 },;
                                 { "vorname", "C", 80, 0 },;
                                 { "user_ip", "C", 20, 0 } } )
   endif
   
   USE clients SHARED
   
   APPEND BLANK
   
   if RLock()
      clients->title   := aParams[ 2 ]
      clients->family  := aParams[ 3 ]
      clients->vorname := aParams[ 4 ]
      clients->user_ip := GetEnv( "REMOTE_ADDR" )
      DbUnLock()
   endif    

   Browse()

return nil

//----------------------------------------------------------------------------// 

function Browse()

   local oDlg, oBrw

   if ! File( "clients.dbf" )
      DbCreate( "clients.dbf", { { "title",   "C", 10, 0 },;
                                 { "family",  "C", 80, 0 },;
                                 { "vorname", "C", 80, 0 } } )
   endif
   
   USE clients SHARED
   
   DEFINE DIALOG oDlg TITLE "Clients browse" SIZE 800, 600
   
   @ 10, 10 BROWSE oBrw SIZE 500, 400 OF oDlg
   
   ACTIVATE DIALOG oDlg NOWAIT
   
   USE

return nil

//----------------------------------------------------------------------------//                                  
