#include "FiveWeb.ch"

function Main()

   local oDlg, cName := Space( 50 ), dDate := Space( 10 )

   DEFINE DIALOG oDlg TITLE "GET with PICTURE"

   @ 20, 20 SAY "Name:" OF oDlg
   
   @ 20, 100 GET cName SIZE 200, 30 OF oDlg	

   @ 70, 20 SAY "Date:" OF oDlg

   @ 70, 100 GET dDate SIZE 130, 30 ;
      PICTURE "99/99/9999" OF oDlg

   @ 250, 250 BUTTON "Ok" OF oDlg ;
      ACTION ( oDlg:End() )  // ( ... ) processed in the server

   ACTIVATE DIALOG oDlg CENTERED

return nil