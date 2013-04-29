#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TButton FROM TControl

   DATA  cPrompt
   DATA  cAction
   DATA  cResName

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName, cAction,;
               cResName )

   METHOD Define( oWnd, cAction, cResName, cVarName )

   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd, cVarName, cAction,;
            cResName ) CLASS TButton

   DEFAULT cPrompt  := "Button"
   DEFAULT cVarName := "oBtn" + AllTrim( Str( ::nBtns++ ) )
   DEFAULT nWidth   := 110, nHeight :=  40
   
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

METHOD Define( oWnd, cAction, cResName, cVarName ) CLASS TButton

   DEFAULT cVarName := "oBtn" + AllTrim( Str( ::nBtns++ ) )

   ::Super:New( 1, If( Empty( oWnd:aControls ), 1,;
                oWnd:nHeight * Len( oWnd:aControls ) ),;
                oWnd:nHeight, oWnd:nHeight, cVarName, oWnd )

   ::cAction  = cAction 
   ::cResName = cResName  

   ? '<button id="' + ::cVarName + '" ' + ;
     'style = "' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px; " >' + ; 
     "</button>"

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
