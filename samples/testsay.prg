// Using controls

#include "FiveWeb.ch"

function Main()

   local oDlg, osay
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
      @ 240,260 SAY oSay PROMPT "Hola Mundo" OF oDlg SIZE 300, 40
   
      @ 120, 370 BUTTON "ok" SIZE 120, 50 OF oDlg
        
   ACTIVATE DIALOG oDlg 

return nil