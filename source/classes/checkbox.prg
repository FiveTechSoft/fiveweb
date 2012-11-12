#include "FiveWeb.ch"

CLASS TCheckBox

   DATA  cPrompt
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 
   DATA  lChecked
   DATA lButtonStyle

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, lChecked, cPrompt, nWidth, nHeight, oWnd , lButtonStyle )

   METHOD Activate()

ENDCLASS

METHOD New( nRow, nCol, lChecked, cPrompt, nWidth, nHeight, oWnd ,lButtonStyle ) CLASS TCheckBox

   DEFAULT cPrompt := "CheckBox"
   DEFAULT lButtonStyle:= .f.

   ::nTop     = nRow
   ::nLeft    = nCol
   ::cPrompt  = cPrompt
   ::nWidth   = nWidth
   ::nHeight  = nHeight
   ::cVarName = "oChk" + AllTrim( Str( ::nBtns++ ) )
   ::lChecked = lChecked   
   ::lButtonStyle:= lButtonStyle
    
   
   ? '<div id="div"'+::cVarName +;
   ' style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft + 90 ) ) + 'px;" >' 
        
     
   ? '<input id="' + ::cVarName + '" ' + ;
     'type="checkbox" ' + If( lChecked, "checked", "" )+'/>' 
      
   ? "<label for='" + ::cVarName +"'>" + ::cPrompt
   ? "</label>"  
   ? "</div>"

   oWnd:AddControl( Self )


return Self

METHOD Activate() CLASS TCheckBox

 if ::lButtonStyle
 
    ? "<script>"
       ? '$( "#' + ::cVarName + '" ).button();'    
    ? "</script>"
endif
   
return nil   