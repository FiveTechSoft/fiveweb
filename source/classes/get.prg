#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TGet FROM TControl

   DATA  uValue 
   	
   DATA  cPicture	
   
   DATA  lMultiline

   CLASSDATA nGets INIT 1

   METHOD New( nRow, nCol, uValue, nWidth, nHeight, oWnd, cVarName, lHidden,;
               lPassword, cPicture, lMultiline )

   METHOD Activate() 

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, uValue, nWidth, nHeight, oWnd, cVarName, lHidden,;
            lPassword, cPicture, lMultiline ) CLASS TGet

   DEFAULT cVarName := "oGet" + AllTrim( Str( ::nGets++ ) )
   DEFAULT nWidth  := Len( cValToChar( uValue ) ) * 8, nHeight := 40
   DEFAULT lHidden := .F., lPassword := .F., lMultiline := .F. 
      
   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )

   ::cPicture   = cPicture
   ::lMultiline = lMultiline

   if ! ::lMultiline
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
   else
      if lHidden
         ? '<input type="hidden" id="' + ::cVarName + '" ' + ;
           'value = "' + cValToChar( uValue )+'"' + '>'
      else
         ? '<textarea' + ;
           ' id="' + ::cVarName + '" ' + ;
           ' style="' + 'position: absolute; ' + ;
           'top: ' + AllTrim( Str( ::nTop ) ) + 'px; ' + ;
           'left: ' + AllTrim( Str( ::nLeft ) ) + 'px; ' + ; 
           'width: ' + AllTrim( Str( ::nWidth ) ) + 'px; '  + ; 
           'height: ' + AllTrim( Str( ::nHeight ) ) + 'px;">' + ;
           If( ! Empty( uValue ), cValToChar( uValue ), "" ) + ; 
           '</textarea>'
      endif     
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