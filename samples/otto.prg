#include "FiveWeb.ch"

function Main()

   local oDlg 
   local cTitle := Space( 80 ), cFamilien := Space( 80 ), cVorname := Space( 80 )
   
   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg"
   
   SetTheme( "flick" )
   
   DEFINE DIALOG oDlg TITLE "Otto example" SIZE 600, 400
   
   @ 12, 10 SAY "Title:" OF oDlg

   @ 10, 160 GET cTitle OF oDlg SIZE 300, 35

   @ 54, 10 SAY "FamilienName:" OF oDlg

   @ 52, 160 GET cFamilien OF oDlg SIZE 300, 35

   @ 94, 10 SAY "Vorname:" OF oDlg

   @ 90, 160 GET cVorname OF oDlg SIZE 300, 35

   @ 240, 160 BUTTON "Ok" OF oDlg

   @ 240, 300 BUTTON "Cancel" OF oDlg

   ACTIVATE DIALOG oDlg NOWAIT

return nil
