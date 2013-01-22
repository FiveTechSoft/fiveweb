// Using ProgressBars

#include "FiveWeb.ch"

function Main()

   local oDlg, oPrg, nValue := 30
   
   DEFINE DIALOG oDlg TITLE "Using ProgressBars" SIZE 600, 400
   
   @ 120, 140 PROGRESS oPrg VAR nValue SIZE 300, 40 OF oDlg

   @ 200, 140 BUTTON "<<" OF oDlg SIZE 60, 40 ;
      ACTION ( oPrg:SetStep( -1 ) )

   @ 200, 380 BUTTON ">>" OF oDlg SIZE 60, 40 ;
      ACTION ProgressInc( "oPrg", 10 )

   ACTIVATE DIALOG oDlg 

return nil
