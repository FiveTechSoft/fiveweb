#include "FiveWeb.ch"

function Main()

   local oDlg, oImg

   DEFINE DIALOG oDlg TITLE "Using images"

   @ 10, 10 IMAGE oImg OF oDlg SIZE 100, 80

   ACTIVATE DIALOG oDlg

return nil