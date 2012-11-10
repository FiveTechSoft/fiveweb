#include "FiveWeb.ch"

CLASS TMenuItem

   DATA   cPrompt
   DATA   cAction
   DATA   oPopup

   METHOD New( cPrompt, cAction )
   
   METHOD Activate( lMain, nLevel )

ENDCLASS

METHOD New( cPrompt, cAction ) CLASS TMenuItem

   DEFAULT cAction := ""

   ::cPrompt = cPrompt
   ::cAction = cAction

return Self

METHOD Activate( lMain, nLevel ) CLASS TMenuItem

   DEFAULT lMain := .F., nLevel := 1

   ? Space( 3 * ( nLevel - 1 ) ) + "<li>"
   ? Space( 3 * ( nLevel - 1 ) ) + ;
     "<a href='#' onclick='" + ::cAction + "'>" + ::cPrompt + ;
     If( ::oPopup != nil .and. ! lMain, '<span class="arrow">&#9654;</span>', "" ) + "</a>"

   if ::oPopup != nil
      ::oPopup:Activate( .F., nLevel + 1 )
   endif

   ? Space( 3 * ( nLevel - 1 ) ) + "</li>"

return nil