#include "FiveWeb.ch"

function Main()

   local oDlg, oFld

   DEFINE DIALOG oDlg TITLE "Using folders"

   @ 10, 10 FOLDER oFld PROMPTS "One", "Two", "Three" OF oDlg SIZE 400, 300

   ACTIVATE DIALOG oDlg

return nil