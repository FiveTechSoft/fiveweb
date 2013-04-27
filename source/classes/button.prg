#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TButton FROM TControl

   DATA  cPrompt
   DATA  cAction
   DATA  cResName

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName, cAction,;
               cResName )

   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName, cAction,;
            cResName ) CLASS TButton

   DEFAULT cPrompt  := If( ! oWnd:isKindOf( "TTOOLBAR" ), "Button", "" )
   DEFAULT cVarName := "oBtn" + AllTrim( Str( ::nBtns++ ) )
   DEFAULT nWidth   := If( ! oWnd:isKindOf( "TTOOLBAR" ), 110, oWnd:nHeight ),;
           nHeight  := If( ! oWnd:isKindOf( "TTOOLBAR" ), 40, oWnd:nHeight )
   
   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
   
   ::cPrompt  = cPrompt
   ::cAction  = cAction 
   ::cResName = cResName  

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

   if ::oWnd:IsKindOf( "TTOOLBAR" )
      ? "<script>"
      if Empty( ::cPrompt )
         ? '$( "#' + ::cVarName + '" ).button( { text: false,' + ;
           ' icons: { primary: "' + ::cResName + '" } } );'
      else
         ? '$( "#' + ::cVarName + '" ).button( {' + ;
           ' icons: { primary: "ui-icon-seek-start" } } );'
      endif
   else
      ? "<script>"
      ? '$( "#' + ::cVarName + '" ).button();'
   endif

   if ! Empty( ::cAction )
      ? '$( "#' + ::cVarName + '" ).click( function( event ){ ' + ::cAction + " } );"
   endif      

   ? "</script>"
   
return nil

//----------------------------------------------------------------------------//   
