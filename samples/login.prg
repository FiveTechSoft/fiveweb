#include "FiveWeb.ch"

function Main()

   local oDlg, oImg
   local oGetName, cUserName := Space( 30 )
   local oGetPass, cPassword := ""

   DEFINE DIALOG oDlg TITLE "Login" SIZE 650, 400

   @  30,  30 IMAGE oImg FILENAME "../images/user.png" SIZE 120, 120 OF oDlg

   @  69, 190 SAY "User" SIZE 110, 40 OF oDlg

   @ 124, 190 SAY "Password" SIZE 110, 40 OF oDlg

   @  66, 315 GET oGetName VAR cUserName SIZE 300, 40 OF oDlg

   @ 124, 315 GET oGetPass VAR cPassword SIZE 300, 40 OF oDlg PASSWORD

   @ 265, 189 BUTTON "Ok" SIZE 110, 40 OF oDlg ;
      ACTION MsgInfo( oGetName.value + CRLF + oGetPass.value ); // executed in the client in javascript

   @ 265, 335 BUTTON "Cancel" SIZE 110, 40 OF oDlg ;
      ACTION ( oDlg:End() ) // Executed in the server in advance

   ACTIVATE DIALOG oDlg

return nil