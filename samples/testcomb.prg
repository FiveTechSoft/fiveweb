#include "FiveWeb.ch"

function Main()

   local oDlg, oCbx

   DEFINE DIALOG oDlg TITLE "Using a combobox"

   @ 30, 30 COMBOBOX oCbx ITEMS "one", "two", "three" ;
      OF oDlg

   ACTIVATE DIALOG oDlg NOWAIT

return nil