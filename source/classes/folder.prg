#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TFolder

   DATA  aPrompts
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 

   CLASSDATA nVars INIT 1

   METHOD New( nRow, nCol, aPrompts, nWidth, nHeight, oWnd, cVarName )                       

   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, aPrompts, nWidth, nHeight, oWnd, cVarName ) CLASS TFolder

   local n

   DEFAULT cVarName := "oFld" + AllTrim( Str( ::nVars++ ) )
   
   ::cVarName = cVarName
   ::nTop     = nRow
   ::nLeft    = nCol
   ::nWidth   = nWidth
   ::nHeight  = nHeight
   ::aPrompts = aPrompts

   ? '<div id="'+ ::cVarName + '" ' + ;
     'style="'  + ;
     "top: "    + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: "   + AllTrim( Str( ::nLeft ) ) + "px; " + ;
     "width: "  + AllTrim( Str( ::nWidth ) ) + "px; " + ;
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px;" >'

   ? "<ul>"
   for n = 1 to Len( aPrompts )
      ? "<li>" + "<a href=#tab" + AllTrim( Str( n ) ) + ">" + aPrompts[ n ] + "</a></li>"
   next         
   ? "</ul>"
         
   for n = 1 to Len( aPrompts )
      ? '<div id="tab' + AllTrim( Str( n ) ) + '">Contents of ' + AllTrim( Str( n ) ) + "</div>"
   next         
     
   oWnd:AddControl( Self )

return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TFolder

    ? "<script>"
    ? '$( "#' + ::cVarName + '" ).tabs();'
    ? "</script>"
   
return nil   

//----------------------------------------------------------------------------//