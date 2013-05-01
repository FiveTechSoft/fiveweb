#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TComboBox FROM TControl

   CLASSDATA nCtrls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, aItems, cVarName )

   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, aItems, cVarName ) CLASS TComboBox

   local cItem

   DEFAULT nWidth := 300, nHeight := 300, aItems := {} 
   DEFAULT cVarName := "oBtn" + AllTrim( Str( ::nCtrls++ ) )

   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
      
   ? '<div id="div"'+::cVarName + " " + ;
     'class="ui.widget "' + ;
     'style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + 'px;" >' 
        
   ? '<select id="combobox">'     

   for each cItem in aItems
      ? '<option value="' + cItem + '">' + cItem + "</option>"
   next   

   ? '</select>'     
        
   ? "</div>"

return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TComboBox

   ? "<script>"
   ? '$( "#' + ::cVarName + '" ).combobox();'    
   ? "</script>"
   
return nil   

//----------------------------------------------------------------------------//