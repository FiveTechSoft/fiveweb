#include "FiveWeb.ch"

CLASS TRadMenu

   DATA  cPrompt
   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 
   DATA  lChecked

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, acItems, nWidth, nHeight, oWnd, cVarName )

   METHOD Activate()

ENDCLASS

METHOD New( nRow, nCol, acItems, nWidth, nHeight, oWnd, cVarName ) CLASS TRadMenu

   DEFAULT acItems := {}
   DEFAULT cVarName := "oRadio" + AllTrim( Str( ::nBtns++ ) )
   
   ::cVarName = cVarName
   
   ::nTop     = nRow
   ::nLeft    = nCol
    ::nWidth   = nWidth
   ::nHeight  = nHeight
    

  ? '<form id="'+ ::cVarName +'" style="'+ "position: absolute; " + ;
         "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
         "left: " + AllTrim( Str( ::nLeft + 90 ) ) + 'px;" >'
         
   ? '<div id="radio">'        
         
   for i= 1 to len(acItems) 
   
   ? '<input type="radio" id="'+ ::cVarName + AllTrim(str(i)) + '" ' + ; 
     ' name="radio" />'+;  
     '<label for = "'+ ::cVarName + AllTrim(str(i)) + '"> '+ ;
         acItems[i]+' </label>'    
         
  Next
   
   ? '</div>'
   ? "</form>"  
     
   oWnd:AddControl( Self )

return Self

METHOD Activate() CLASS TRadMenu

    ? "<script>"
     ? '$( "#' + ::cVarName + '" ).buttonset();'
    ? "</script>"
   
return nil   