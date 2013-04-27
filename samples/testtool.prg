#include "FiveWeb.ch"

function Main()

   local oDlg, oTbr, oBtn

   DEFINE DIALOG oDlg TITLE "Using toolbars"

   DEFINE TOOLBAR oTbr OF oDlg

   @ 1, 1 BUTTON oBtn PROMPT "" ;
      RESOURCE "ui-icon-seek-start" ;
      OF oTbr ACTION MsgInfo( "click" )

   ACTIVATE DIALOG oDlg NOWAIT

return nil
