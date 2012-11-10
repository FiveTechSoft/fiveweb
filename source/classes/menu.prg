#include "FiveWeb.ch"

CLASS TMenu

   DATA  aItems INIT {}
   DATA  cVarName
   DATA  oPopup

   METHOD New( cVarName )
   
   METHOD AddItem( oItem ) INLINE AAdd( ::aItems, oItem )

   METHOD Activate( lMain, nLevel )

ENDCLASS

METHOD New( cVarName ) CLASS TMenu

   ::cVarName = cVarName
   
return Self   

METHOD Activate( lMain, nLevel ) CLASS TMenu

   local oItem

   DEFAULT lMain := .F., nLevel := 1

   if ! lMain 
      ? Space( 3 * ( nLevel - 1 ) ) + "<ul>"
   else   
      ? '<div id="' + ::cVarName + '" oncontextmenu="MenuBar( this ); return false;">'
      ? '<ul class="nav">'
   endif
   
   for each oItem in ::aItems  
      oItem:Activate( lMain, nLevel )
   next
   
   ? Space( 3 * ( nLevel - 1 ) ) + "</ul>"
   
   if lMain
      ? '<div class="clear"></div>'
      ? '</div>'
   endif   
   
return nil      