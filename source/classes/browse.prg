#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TBrowse FROM TControl

   DATA cUrl

   CLASSDATA nControls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl )

   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl ) CLASS TBrowse

   DEFAULT cVarName := "oSay" + AllTrim( Str( ::nControls++ ) )
      
   Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )   

   ::cUrl = cUrl
      
   ? '<div id="'+ ::cVarName + '" ' + ;
     'style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px;" >' + ;
     "</div>"

return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TBrowse

   ? "<script>"
   ? '$( "#' + ::cVarName + '" ).load( "' + ::cUrl + '" );'
   ? "</script>"
   
return nil

//----------------------------------------------------------------------------//    