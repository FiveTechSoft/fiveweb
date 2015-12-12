#include "FiveWeb.ch"

function Main()

   local oDlg
   local oGetFirst, cFirst := Space( 30 )
   local oGetSecond, cSecond := Space( 30 )
   local oGetThird, cThird := Space( 30 )
   local oGetFourth, cFourth := Space( 30 )

   DEFINE DIALOG oDlg TITLE "FiveWeb data entry test" ;
      SIZE 550, 500
      
   @ 40, 31 SAY "first:" SIZE 110, 40 OF oDlg

   @ 105, 31 SAY "second:" SIZE 110, 40 OF oDlg

   @ 170, 31 SAY "third:" SIZE 110, 40 OF oDlg

   @ 234, 30 SAY "fourth:" SIZE 110, 40 OF oDlg

   @ 39, 162 GET oGetFirst VAR cFirst SIZE 300, 40 OF oDlg

   @ 106, 162 GET oGetSecond VAR cSecond SIZE 300, 40 OF oDlg

   @ 169, 161 GET oGetThird VAR cThird SIZE 300, 40 OF oDlg

   @ 235, 162 GET oGetFourth VAR cFourth SIZE 300, 40 OF oDlg

   @ 372, 73 BUTTON "Save" SIZE 110, 40 OF oDlg ;
      ACTION MsgInfo( "Save" )

   @ 372, 209 BUTTON "Review" SIZE 110, 40 OF oDlg ;
      ACTION MsgInfo( "Review" )

   @ 372, 341 BUTTON "Exit" SIZE 110, 40 OF oDlg ;
      ACTION ( oDlg:End() )  // ( ... ) means processed in advance in the server

   ACTIVATE DIALOG oDlg

return nil