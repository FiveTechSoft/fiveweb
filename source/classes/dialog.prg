#include "FiveWeb.ch"

CLASS TDialog

   DATA  cTitle
   DATA  nWidth, nHeight
   DATA  lModal
   DATA  aControls INIT {}
   DATA  cVarName 

   METHOD New( cTitle, nWidth, nHeight, cVarName )
   
   METHOD Activate( lModal )

   METHOD AddControl( oControl ) INLINE AAdd( ::aControls, oControl ),;
                                        oControl:oWnd := Self

ENDCLASS

METHOD New( cTitle, nWidth, nHeight, cVarName ) CLASS TDialog

   DEFAULT nWidth := 600, nHeight := 500

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
   ? '$( "#oDlg" ).dialog( { width: ' + AllTrim( Str( ::nWidth ) ) + ;
     ", height: " + AllTrim( Str( ::nHeight ) ) + ;
     ", modal:" + If( ::lModal ,"true" , "false"  ) + " } );"
   ? "</script>"
   
   for each oControl in ::aControls
      oControl:Activate()
   next   
   
return nil   
