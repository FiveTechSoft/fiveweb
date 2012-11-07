
#include "FiveWeb.ch"

function Main()

   local oDlg, lValue := .T.
   local odpick
   
   DEFINE DIALOG oDlg TITLE "Hello FiveWeb" SIZE 600, 400
    
     @ 120, 370 BUTTON "ok" SIZE 120, 50 OF oDlg     
   
     @ 60, 60 DTPICKER odpick OF oDlg SIZE 150 ,40
     
 //  odpick:=TDatePicker():New( 60, 56, 150, 50 , oDlg ) 
    
     
   ACTIVATE DIALOG oDlg 


Return nil
