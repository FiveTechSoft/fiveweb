#include "FiveWeb.ch"

CLASS TDatepicker

   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, lInline )

   METHOD Activate()

ENDCLASS


METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName,lInline ) CLASS TDatepicker

    DEFAULT cVarName := "oDatePick" + AllTrim( Str( ::nBtns++ ) )
    DEFAULT lInline := .f.
    
   ::cVarName = cVarName

   ::nTop     = nRow
   ::nLeft    = nCol
   ::nWidth   = nWidth
   ::nHeight  = nHeight
 
 if lInline
  
  ? '<div id="'+ ::cVarName +; 
    '" style = "' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px; " >'  
  ? '</div>'

 else  
   ? '<input type="text" id="'+ ::cVarName +;    
     '" style = "' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px; " />'  
     
 endif    
  
   oWnd:AddControl( Self )

return Self


METHOD Activate() CLASS TDatepicker

  ? "<script>"
  ? '$( "#' + ::cVarName + '" ).datepicker();'
  ? "</script>"
   
return nil   