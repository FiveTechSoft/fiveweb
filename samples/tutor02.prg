#include "FiveWeb.ch"

function Main()

   local oDlg
   
   SET BACKIMAGE TO "https://bitbucket.org/fivetech/screenshots/downloads/office.bmp"
   
   SetTheme( "cupertino" )
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
   ACTIVATE DIALOG oDlg NOWAIT

return nil
