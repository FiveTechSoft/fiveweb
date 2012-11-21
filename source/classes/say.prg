#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TSay FROM TControl

   DATA  cText
   DATA  cUrl

   CLASSDATA nSays INIT 1

   METHOD New( nRow, nCol, cText, nWidth, nHeight, oWnd, cVarName, cURL )

   METHOD Activate() VIRTUAL

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, cText, nWidth, nHeight, oWnd, cVarName, cUrl ) CLASS TSay

   DEFAULT cVarName := "oSay" + AllTrim( Str( ::nSays++ ) )
   
   DEFAULT cText := "Say", nWidth := Len( cText ) * 12, nHeight := 40
   
   Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
      
   ::cUrl  = cUrl
   ::cText = cText
       
   ? If( Empty(::cUrl ), '<label id="', '<a id="' ) + ;
     ::cVarName + '" '+ ;
     'style = "' + 'position: absolute; ' + ;
     'top: ' + AllTrim( Str( ::nTop ) ) + 'px; ' + ;
     'left: ' + AllTrim( Str( ::nLeft ) ) + 'px; ' + ; 
     'width: ' + AllTrim( Str( ::nWidth ) ) + 'px; ' + ; 
     'height: ' + AllTrim( Str( ::nHeight ) ) + 'px;" ' + ;
     If( Empty( ::cUrl ),'', 'href="' + ::cUrl + '"' ) + ;
     ' > '
    
  ? ::cText  
  ? If( Empty( ::cUrl ), ' </label>', ' </a>' ) 

return Self

//----------------------------------------------------------------------------//