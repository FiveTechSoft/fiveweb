#include "FiveWeb.ch"

CLASS TMenu

   DATA  aItems INIT {}
   DATA  cVarName
   DATA  oPopup

   METHOD New( cVarName )
   
   METHOD AddItem( oItem ) INLINE AAdd( ::aItems, oItem )

   METHOD Activate( lMain )

ENDCLASS

METHOD New( cVarName ) CLASS TMenu

   ::cVarName = cVarName
   
return Self   

METHOD Activate( lMain ) CLASS TMenu

   local oItem

   DEFAULT lMain := .F.

   if ! lMain 
      ? "<ul>"
   else   
      ? '<div id="' + ::cVarName + '" oncontextmenu="MenuBar( this ); return false;">'
      ? '<ul class="nav">'
   endif
   
   for each oItem in ::aItems  
      oItem:Activate( lMain )
   next
   
   ? "</ul>"
   
return nil      