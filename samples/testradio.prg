
#include "FiveWeb.ch"

function Main()

   local oDlg, lValue := .T.
   local oRad
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
   
   @ 20,16 RADIO oRad ITEMS "uno","dos","tres" OF oDlg SIZE 50,50 
    
     
   ACTIVATE DIALOG oDlg 

return nil


Return nil
