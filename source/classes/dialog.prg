#include "FiveWeb.ch"

CLASS TDialog

   DATA  cTitle
   DATA  nWidth, nHeight
   DATA  lModal
   DATA  aControls INIT {}

   METHOD New( cTitle, nWidth, nHeight )
   
   METHOD Activate( lModal )

   METHOD AddControl( oControl ) INLINE AAdd( ::aControls, oControl ),;
                                        oControl:oWnd := Self

ENDCLASS

METHOD New( cTitle, nWidth, nHeight ) CLASS TDialog

   ::cTitle  = cTitle
   ::nWidth  = nWidth
   ::nHeight = nHeight

   ? '<div id="oDlg" class="dialog_window" title="' + ::cTitle + '">'

return Self

METHOD Activate( lModal ) CLASS TDialog

   local oControl

   DEFAULT lModal := .T.

   ::lModal = lModal

   ? "</div>" 
   ? "<script>"
   ? "$('#oDlg').dialog( { width: " + AllTrim( Str( ::nWidth ) ) + ;
     ", height: " + AllTrim( Str( ::nHeight ) ) + ;
     ", modal:" + If( ::lModal ,"true" , "false"  ) + " } );"
   ? "</script>"
   
   for each oControl in ::aControls
      oControl:Activate()
   next   
   
return nil   
