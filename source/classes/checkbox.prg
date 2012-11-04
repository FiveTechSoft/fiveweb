#include "FiveWeb.ch"

CLASS TCheckBox

   DATA  cPrompt
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 
   DATA  lChecked

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd )

   METHOD Activate()

ENDCLASS

METHOD New( nRow, nCol, cPrompt, nWidth, nHeight, oWnd ) CLASS TCheckBox

   DEFAULT cPrompt := "CheckBox"

   ::nTop     = nRow
   ::nLeft    = nCol
   ::cPrompt  = cPrompt
   ::nWidth   = nWidth
   ::nHeight  = nHeight
   ::cVarName = "oChk" + AllTrim( Str( ::nBtns++ ) )

   ? "<label " + ;
     'style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft + 90 ) ) + 'px;" >' 
   ? '<input id="' + ::cVarName + '" ' + ;
     'type="checkbox" >' + ;
     " " + ::cPrompt
   ? "</label>"  

   oWnd:AddControl( Self )

return Self

METHOD Activate() CLASS TCheckBox

   // ? "<script>"
   // ? '$( "#' + ::cVarName + '" ).button();'
   // ? "</script>"
   
return nil   