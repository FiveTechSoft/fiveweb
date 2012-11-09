// Using controls

#include "FiveWeb.ch"

function Main()

   local oDlg, lValue := .T.
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
   @ 120,  70 BUTTON "One" SIZE 120, 50 OF oDlg ACTION MsgInfo( "one" )

   @ 120, 220 BUTTON "Two" SIZE 120, 50 OF oDlg ACTION MsgInfo( "two" )

   @ 120, 370 BUTTON "Three" SIZE 120, 50 OF oDlg ACTION MsgInfo( "three" )
   
   @ 200, 160 CHECKBOX lValue PROMPT "Tested" SIZE 150, 40 OF oDlg
   
   ACTIVATE DIALOG oDlg 

return nil
