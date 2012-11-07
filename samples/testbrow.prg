#include "FiveWeb.ch"

function Main()

   local oDlg, oBrw

   DEFINE DIALOG oDlg TITLE "MySQL browse" ;
      SIZE 1000, 600

   @ 10, 10 BROWSE oBrw SIZE 800, 700 OF oDlg ;
      URL "../mybrowse.php?name=clients"

   ACTIVATE DIALOG oDlg

return nil