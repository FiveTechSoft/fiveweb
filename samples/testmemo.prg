#include "FiveWeb.ch"

function Main()

   local oDlg, cText := PadR( "This is a text", 50 )

   DEFINE DIALOG oDlg

   @ 10, 10 GET cText MULTILINE OF oDlg SIZE 300, 200

   ACTIVATE DIALOG oDlg CENTERED

return nil