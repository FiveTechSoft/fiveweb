#include "FiveWeb.ch"

function Main()

   local oDlg, oTbr, oBtn

   DEFINE DIALOG oDlg TITLE "Using toolbars"

   DEFINE TOOLBAR oTbr OF oDlg

   @ 1, 1 BUTTON oBtn OF oTbr SIZE 50, 50 ;
      ACTION MsgInfo( "click" )

   // ? oBtn:ClassName()

   // oBtn:Activate()

   ACTIVATE DIALOG oDlg NOWAIT

return nil
