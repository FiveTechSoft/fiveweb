#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TComboBox FROM TControl

   DATA aItems

   CLASSDATA nCtrls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, aItems, cVarName, uVar, bWhen )

   METHOD Activate() VIRTUAL

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, aItems, cVarName, uVar, bWhen ) CLASS TComboBox

   local n, lWhen := .T.
   
   DEFAULT nWidth := 300, nHeight := 300, aItems := {} 
   DEFAULT cVarName := "oCbx" + AllTrim( Str( ::nCtrls ) )

   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
      
   ::aItems = aItems   
   
   if bWhen != nil
      ::bWhen = bWhen
      lWhen = Eval( bWhen )
   endif
   
   ? '<div id="' + ::cVarName + '" ' + ;
     'class="ui.widget" ' + ;
     'style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + 'px;" >' 
        
   ? '<select id="' + ::cVarName + '.at" '+ If( ! lWhen, "disabled", "" ) + '>'

   for n = 1 to Len( aItems )
      if ValType( aItems[ n ] ) == "A"	
         ? '<option value="' + aItems[ n ][ 1 ] + '">' + aItems[ n ][ 1 ] + "</option>"
      else   			
         ? '<option value="' + aItems[ n ] + '"' + ;
         If( AScan( aItems, uVar ) == n, " selected ", "" ) + '>' + aItems[ n ] + "</option>"
      endif
   next   

   ? '</select>'     
        
   ? "</div>"

return Self

//----------------------------------------------------------------------------//