#include "FiveWeb.ch"

function Main(cParams)

   SetTheme("flick")
   BuildMenu()
   if pcount() > 0
      Process(cParams)
      return nil
   endif
return nil
//----------------------------------------------------------------------------------------------
function BuildMenu()
local AppName := AppName(),oMenu

   MENU oMenu

      MENUITEM "Files"
      MENU 
         MENUITEM "Log Job" action ('document.location = "'+appname()+'?fnLogJobs"')
         MENUITEM "Display Jobs"  action  ('document.location = "'+appname()+'?fnDisplayJobs"')
      ENDMENU
      
      MENUITEM "Reports"
      MENU 
         MENUITEM "Clients"
         MENU
            MENUITEM "List"
            MENUITEM "By Last name" 
            MENUITEM "By State" 
         ENDMENU
         
         MENUITEM "Stock"
         MENU 
            MENUITEM "By id"
            MENUITEM "By amount"
            MENUITEM "My price"
         ENDMENU
      ENDMENU
      
      MENUITEM "Utilities"
      
   ENDMENU

return nil
//---------------------------------------------------------------------------------------------//
function Process(cParams)
local aParams := hb_aTokens(cParams,":")

do case
   case aParams[1] == "fnLogJobs"
      fnLogJobs(aParams)

   case aParams[1] == "fnDisplayJobs"
      fnDisplayJobs(aParams)


endcase
return(nil)
//-----------------------------------------------------------------------------------------------//
function fnLogJobs(aParams)
local oDlg

   DEFINE DIALOG oDlg TITLE "Log Service Job" SIZE 800, 600

   @ 12 ,10 SAY 'Log Service Jobs' of oDlg

   @ 475 , 100 BUTTON "Cancel"    of oDlg ACTION (oDlg:Close())
   @ 475 , 250 BUTTON "Add"       of oDlg ACTION (MsgInfo('add user'))
   @ 475 , 400 BUTTON "Save"      of oDlg ACTION (MsgInfo('save user'))
   
   ACTIVATE DIALOG oDlg NOWAIT
return(nil)

//-----------------------------------------------------------------------------------------------//
function fnDisplayJobs(aParams)
local oDlg

   DEFINE DIALOG oDlg TITLE "Display Jobs" SIZE 800, 600

   @ 12 ,10 SAY 'Display Jobs' of oDlg

   @ 475 , 250 BUTTON "Cancel" of oDlg ACTION (oDlg:Close())
   
   ACTIVATE DIALOG oDlg NOWAIT
return(nil)
//-----------------------------------------------------------------------------------------------//

