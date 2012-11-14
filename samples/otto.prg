#include "FiveWeb.ch"

function Main( ... )

   local oDlg, oGet1, oGet2, oGet3 
   local cTitle := Space( 80 ), cFamilien := Space( 80 ), cVorname := Space( 80 )
   
   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg"
   
   SetTheme( "flick" )
   
   if pcount() > 0
      ? " Invoked procedure: " + hb_aParams()[ 1 ] + "<br>"
      ? " Number of params: " + AllTrim( Str( Len( hb_aParams() ) ) ) 
      return nil
   endif

   DEFINE DIALOG oDlg TITLE "Otto example" SIZE 600, 400
   
   @ 12, 10 SAY "Title:" OF oDlg

   @ 10, 160 GET oGet1 VAR cTitle OF oDlg SIZE 300, 35

   @ 54, 10 SAY "FamilienName:" OF oDlg

   @ 52, 160 GET oGet2 VAR cFamilien OF oDlg SIZE 300, 35

   @ 94, 10 SAY "Vorname:" OF oDlg

   @ 90, 160 GET oGet3 VAR cVorname OF oDlg SIZE 300, 35

   @ 150, 160 SAY oSay PROMPT "Please fill this info and press ok" OF oDlg

   @ 260, 160 BUTTON "Ok" OF oDlg ;
      ACTION $( "#oSay" ).load( "../fiveweb/myproc.php?" + ;
                                "title=" + document.getElementById( "oGet1" ).value + ;
                                "&familien=" + document.getElementById( "oGet2" ).value + ;
                                "&vorname=" + document.getElementById( "oGet3" ).value )

   @ 260, 300 BUTTON "Cancel" OF oDlg

   ACTIVATE DIALOG oDlg NOWAIT

return nil
