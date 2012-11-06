#include "FiveWeb.ch"

CLASS TDatepicker

   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName )

   METHOD Activate()

ENDCLASS


METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName ) CLASS TDatepicker

    DEFAULT cVarName := "oDatePick" + AllTrim( Str( ::nBtns++ ) )
   
   ::cVarName = cVarName

   ::nTop     = nRow
   ::nLeft    = nCol
   ::nWidth   = nWidth
   ::nHeight  = nHeight
  
   ? '<input type="text" id="'+ ::cVarName +;        // '" />'  
     '" style = "' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px; " />'  
     
  
   oWnd:AddControl( Self )

return Self


METHOD Activate() CLASS TDatepicker

  ? "<script>"
  ? '$( "#' + ::cVarName + '" ).datepicker();'
  ? "</script>"
   
return nil   