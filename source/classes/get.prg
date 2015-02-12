#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TGet FROM TControl

   DATA  uValue 
   	
   DATA  cPicture	

   CLASSDATA nGets INIT 1

   METHOD New( nRow, nCol, uValue, nWidth, nHeight, oWnd, cVarName, lHidden,;
               lPassword, cPicture )

   METHOD Activate() 

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, uValue, nWidth, nHeight, oWnd, cVarName, lHidden,;
            lPassword, cPicture ) CLASS TGet

   DEFAULT cVarName := "oGet" + AllTrim( Str( ::nGets++ ) )
   DEFAULT nWidth  := Len( cValToChar( uValue ) ) * 8, nHeight := 40
   DEFAULT lHidden := .F., lPassword := .F. 
      
   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )

   ::cPicture = cPicture

   if lHidden
      ? '<input type="hidden" id="' + ::cVarName + '" ' + ;
        'value = "' + cValToChar( uValue )+'"' + '>'
   else
      ? '<input type=' + If( lPassword, "password", "text" ) + ;
        ' id="' + ::cVarName + '" ' + ;
        ' style="' + 'position: absolute; ' + ;
        'top: ' + AllTrim( Str( ::nTop ) ) + 'px; ' + ;
        'left: ' + AllTrim( Str( ::nLeft ) ) + 'px; ' + ; 
        'width: ' + AllTrim( Str( ::nWidth ) ) + 'px; '  + ; 
        'height: ' + AllTrim( Str( ::nHeight ) ) + 'px;" ' + ;
        'value = "' + cValToChar( uValue )+'"' + '>'
   endif

return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TGet

   if ! Empty( ::cPicture )
      ? "<script>"
      ? '$("#' + ::cVarName + '").mask("' + ::cPicture + '");'
      ? "</script>"		
   endif   		

return nil

//----------------------------------------------------------------------------//