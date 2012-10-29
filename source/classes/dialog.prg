#include "FiveWeb.ch"

CLASS TDialog

   DATA  cTitle
   DATA  nWidth, nHeight

   METHOD New( cTitle, nWidth, nHeight )
   METHOD Activate()

ENDCLASS

METHOD New( cTitle, nWidth, nHeight ) CLASS TDialog

   ::cTitle  = cTitle
   ::nWidth  = nWidth
   ::nHeight = nHeight

return Self

METHOD Activate() CLASS TDialog

   ? '<div id="oDlg" class="dialog_window" title="' + ::cTitle + '">'
   ? "</div>" 
   ? "<script>"
   ? "$('#oDlg').dialog( { width: " + AllTrim( Str( ::nWidth ) ) + ;
     ", height: " + AllTrim( Str( ::nHeight ) ) + " } );"
   ? "</script>"
   
return nil   