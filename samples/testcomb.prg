#include "FiveWeb.ch"

function Main()

   local oDlg, oCbx, cValue := "two"

   DEFINE DIALOG oDlg TITLE "Using a combobox"

   @ 30, 30 COMBOBOX oCbx VAR cValue ITEMS "one", "two", "three" ;
      OF oDlg

   @ 120, 120 BUTTON "Ok" OF oDlg ;
      ACTION alert( oCbx.value ) 

   ACTIVATE DIALOG oDlg NOWAIT

return nil