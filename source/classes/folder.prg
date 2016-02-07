#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TFolder

   DATA  aPrompts, aDialogs
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 

   CLASSDATA nVars INIT 1

   METHOD New( nRow, nCol, aPrompts, nWidth, nHeight, oWnd, cVarName )                       

   METHOD Activate( lScript )

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
   ::aDialogs = Array( Len( aPrompts ) )

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
      ? '<div id="tab' + AllTrim( Str( n ) ) + '"></div>'
      ::aDialogs[ n ] = TDialog()
   next         

   oWnd:AddControl( Self )

return Self

//----------------------------------------------------------------------------//

METHOD Activate( lScript ) CLASS TFolder

    local n, m 

    DEFAULT lScript := .T.
    
    if lScript
       ? "<script>"
    endif

    for n = 1 to Len( ::aDialogs )
       for m = 1 to Len( ::aDialogs[ n ]:aControls )
          ? '$( "#' + ::aDialogs[ n ]:aControls[ m ]:cVarName + '"' + " ).detach().appendTo( " + '"#tab' + AllTrim( Str( n ) ) + '" );'
          
          ::aDialogs[ n ]:aControls[ m ]:Activate( .F. ) // don't write <script>
          
          // if ::aDialogs[ n ]:aControls[ m ]:ClassName() == "TGET" .and. ! Empty( ::aDialogs[ n ]:aControls[ m ]:cPicture )
          //    ? '$( "#' + ::aDialogs[ n ]:aControls[ m ]:cVarName + '").mask( "' + ::aDialogs[ n ]:aControls[ m ]:cPicture + '" );'
          // endif   
       next
    next   

    ? '$( "#' + ::cVarName + '" ).tabs();'
    
    if lScript
       ? "</script>"
    endif
   
return nil   

//----------------------------------------------------------------------------//