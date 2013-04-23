#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TImage FROM TControl

   DATA  cUrl

   CLASSDATA nImages INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cURL )

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl ) CLASS TImage

   DEFAULT cVarName := "oImg" + AllTrim( Str( ::nImages++ ) )
   DEFAULT cUrl     := "https://fiveweb.googlecode.com/svn/trunk/images/fivetech.bmp"
   DEFAULT nWidth   := 100, nHeight := 80
   
   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
      
   ::cUrl = cUrl

   ? '<img id="' + ;
     ::cVarName + '" ' + ;
     'style = "' + 'position: absolute; ' + ;
     'top: ' + AllTrim( Str( ::nTop ) ) + 'px; ' + ;
     'left: ' + AllTrim( Str( ::nLeft ) ) + 'px; ' + ; 
     'width: ' + AllTrim( Str( ::nWidth ) ) + 'px; ' + ; 
     'height: ' + AllTrim( Str( ::nHeight ) ) + 'px;" ' + ;
     'src="' + ::cUrl + '"' + ;
     ' > '
    
return Self

//----------------------------------------------------------------------------//