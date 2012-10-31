#include "FiveWeb.ch"

CLASS TDialog

   DATA  cTitle
   DATA  nWidth, nHeight
   DATA  lModal

   METHOD New( cTitle, nWidth, nHeight )
   METHOD Activate( lModal )

ENDCLASS

METHOD New( cTitle, nWidth, nHeight ) CLASS TDialog

   ::cTitle  = cTitle
   ::nWidth  = nWidth
   ::nHeight = nHeight

return Self

METHOD Activate( lModal ) CLASS TDialog

   DEFAULT lModal := .T.

   ::lModal = lModal

   ? '<div id="oDlg" class="dialog_window" title="' + ::cTitle + '">'
   ? "</div>" 
   ? "<script>"
   ? "$('#oDlg').dialog( { width: " + AllTrim( Str( ::nWidth ) ) + ;
     ", height: " + AllTrim( Str( ::nHeight ) ) + ;
     ", modal:" + If( ::lModal ,"true" , "false"  ) + " } );"
   ? "</script>"
   
return nil   
