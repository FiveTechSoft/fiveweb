#include "FiveWeb.ch"

CLASS TButton

   DATA  cPrompt
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName )

   METHOD Activate()

ENDCLASS

METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName ) CLASS TButton

   DEFAULT cPrompt := "Button"
   DEFAULT cVarName := "oBtn" + AllTrim( Str( ::nBtns++ ) )
   
   ::cVarName = cVarName

   ::nTop     = nRow
   ::nLeft    = nCol
   ::cPrompt  = cPrompt
   ::nWidth   = nWidth
   ::nHeight  = nHeight
  
  
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