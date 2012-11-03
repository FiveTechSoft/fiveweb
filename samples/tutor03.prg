// Using controls

#include "FiveWeb.ch"

function Main()

   local oDlg
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
   @ 100,  50 BUTTON "One" SIZE 80, 20 OF oDlg

   @ 100, 150 BUTTON "Two" SIZE 80, 20 OF oDlg

   @ 100, 250 BUTTON "Three" SIZE 80, 20 OF oDlg
   
   ACTIVATE DIALOG oDlg 

return nil