#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TComboBox FROM TControl

   DATA aItems

   CLASSDATA nCtrls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, aItems, cVarName )

   METHOD Activate() VIRTUAL

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, aItems, cVarName ) CLASS TComboBox

   local cItem

   DEFAULT nWidth := 300, nHeight := 300, aItems := {} 
   DEFAULT cVarName := "oBtn" + AllTrim( Str( ::nCtrls++ ) )

   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
      
   ::aItems = aItems   
      		
   ? '<div id="combobox" ' + ;
     'class="ui.widget" ' + ;
     'style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + 'px;" >' 
        
   ? '<select id="' + ::cVarName + '">'     

   for each cItem in aItems
      if ValType( cItem ) == "A"	
         ? '<option value="' + cItem[ 1 ] + '">' + cItem[ 1 ] + "</option>"
      else   			
         ? '<option value="' + cItem + '">' + cItem + "</option>"
      endif
   next   

   ? '</select>'     
        
   ? "</div>"

return Self

//----------------------------------------------------------------------------//