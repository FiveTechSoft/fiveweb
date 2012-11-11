#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TButton FROM TControl

   DATA  cPrompt
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 
   DATA  cAction

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName, cAction )

   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName, cAction ) CLASS TButton

   DEFAULT cPrompt := "Button"
   DEFAULT cVarName := "oBtn" + AllTrim( Str( ::nBtns++ ) )
   DEFAULT nWidth := 110, nHeight := 40
   
   Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
   
   ::cPrompt = cPrompt
   ::cAction = cAction 
  
   ? '<button id="' + ::cVarName + '" ' + ;
     'style = "' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px; " >' + ; 
     ::cPrompt + "</button>"

return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TButton

   ? "<script>"
   ? '$( "#' + ::cVarName + '" ).button();'

   if ! Empty( ::cAction )
      ? '$( "#' + ::cVarName + '" ).click( function( event ){ ' + ::cAction + " } );"
   endif      

   ? "</script>"
   
return nil

//----------------------------------------------------------------------------//   