#include "FiveWeb.ch"

function Main()

   local oDlg, oTbr, oBtn1, oBtn2

   DEFINE DIALOG oDlg TITLE "Using toolbars"

   DEFINE TOOLBAR oTbr OF oDlg

   DEFINE BUTTON RESOURCE "ui-icon-seek-start" ;
      OF oTbr ACTION MsgInfo( "one" )

   DEFINE BUTTON RESOURCE "ui-icon-seek-prev" ;
      OF oTbr ACTION MsgInfo( "two" )

   DEFINE BUTTON RESOURCE "ui-icon-play" ;
      OF oTbr ACTION MsgInfo( "three" )

   DEFINE BUTTON RESOURCE "ui-icon-pause" ;
      OF oTbr ACTION MsgInfo( "four" )

   DEFINE BUTTON RESOURCE "ui-icon-seek-next" ;
      OF oTbr ACTION MsgInfo( "five" )

   DEFINE BUTTON RESOURCE "ui-icon-seek-end" ;
      OF oTbr ACTION MsgInfo( "six" )

   ACTIVATE DIALOG oDlg NOWAIT

return nil
