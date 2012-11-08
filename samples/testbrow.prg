#include "FiveWeb.ch"

function Main()

   local oDlg, oBrw

   DEFINE DIALOG oDlg TITLE "MySQL browse" ;
      SIZE 1000, 600

   @ 10, 10 BROWSE oBrw SIZE 980, 500 OF oDlg ;
      URL "../fiveweb/mybrowse.php?name=clients"

   @ 500, 30 BUTTON "<<" OF oDlg SIZE 50, 35

   @ 500, 110 BUTTON ">>" OF oDlg SIZE 50, 35

   @ 500, 200 BUTTON "Add" OF oDlg

   @ 500, 330 BUTTON "Edit" OF oDlg

   @ 500, 460 BUTTON "Delete" OF oDlg

   @ 500, 590 BUTTON "Search" OF oDlg

   @ 500, 720 BUTTON "Print" OF oDlg

   @ 500, 850 BUTTON "Exit" OF oDlg

   ACTIVATE DIALOG oDlg

return nil
