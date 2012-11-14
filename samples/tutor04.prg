#include "FiveWeb.ch"

function Main()

   local oDlg
   
   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg"
   
   SetTheme( "cupertino" )
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
   ACTIVATE DIALOG oDlg NOWAIT

return nil
