// Using controls

#include "FiveWeb.ch"

function Main()

   local oDlg, oSay
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
   @ 20, 20 SAY oSay PROMPT "Hello world" OF oDlg SIZE 300, 40
   
   @ 120, 370 BUTTON "ok" SIZE 120, 50 OF oDlg
        
   ACTIVATE DIALOG oDlg 

return nil