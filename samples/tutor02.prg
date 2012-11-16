#include "FiveWeb.ch"

function Main()

   local oDlg
   
   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg"
   
   SetTheme( "cupertino" )
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
    @ 12, 10 SAY "Hola:" OF oDlg TITLE "Como estas" URL "http://www.google.com"
   
   ACTIVATE DIALOG oDlg NOWAIT

return nil
