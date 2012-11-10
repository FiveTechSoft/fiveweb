#include "FiveWeb.ch"

CLASS TMenuItem

   DATA   cPrompt
   DATA   cAction
   DATA   oPopup

   METHOD New( cPrompt, cAction )
   
   METHOD Activate( lMain )

ENDCLASS

METHOD New( cPrompt, cAction ) CLASS TMenuItem

   DEFAULT cAction := ""

   ::cPrompt = cPrompt
   ::cAction = cAction

return Self

METHOD Activate( lMain ) CLASS TMenuItem

   DEFAULT lMain := .F.

   ? "<li>"
   ? "<a href='#' onclick='" + ::cAction + "'>" + ::cPrompt + ;
     If( ::oPopup != nil .and. ! lMain, '<span class="arrow">&#9654;</span>', "" ) + "</a>"

   if ::oPopup != nil
      ::oPopup:Activate()
   endif

   ? "</li>"

return nil