// Using controls

#include "FiveWeb.ch"

function Main()

   local oDlg
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
   @ 120,  70 BUTTON "One" SIZE 120, 50 OF oDlg

   @ 120, 220 BUTTON "Two" SIZE 120, 50 OF oDlg

   @ 120, 370 BUTTON "Three" SIZE 120, 50 OF oDlg
   
   ACTIVATE DIALOG oDlg 

return nil