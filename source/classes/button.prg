#include "FiveWeb.ch"

CLASS TButton

   DATA  cPrompt
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd )

   METHOD Activate()

ENDCLASS

METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd ) CLASS TButton

   DEFAULT cPrompt := "Button"

   ::nTop     = nRow
   ::nLeft    = nCol
   ::cPrompt  = cPrompt
   ::nWidth   = nWidth
   ::nHeight  = nHeight
   ::cVarName = "oBtn" + AllTrim( Str( ::nBtns++ ) )

   ? '<button id="' + ::cVarName + '" ' + ;
     'style = "' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px; " >' + ; 
     ::cPrompt + "</button>"

   oWnd:AddControl( Self )

return Self

METHOD Activate() CLASS TButton

   ? "<script>"
   ? '$( "#' + ::cVarName + '" ).button();'
   ? "</script>"
   
return nil   