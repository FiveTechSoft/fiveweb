
#include "FiveWeb.ch"

function Main()

   local oDlg, lValue := .T.
   local odpick
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
    
     @ 120, 370 BUTTON "ok" SIZE 120, 50 OF oDlg     
   
     @ 60, 60 DTPICKER odpick OF oDlg SIZE 150 ,40 INLINE
     
    
   ACTIVATE DIALOG oDlg 


Return nil
