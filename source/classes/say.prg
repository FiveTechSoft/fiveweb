#include "FiveWeb.ch"

CLASS TSay

   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 
   DATA cCaption

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cCaption, nWidth, nHeight, oWnd, cVarName )

   METHOD Activate()

ENDCLASS


METHOD New( nRow, nCol, cCaption, nWidth, nHeight, oWnd, cVarName ) CLASS TSay

    DEFAULT cVarName := "oSay" + AllTrim( Str( ::nBtns++ ) )
      
   ::cVarName = cVarName
   ::cCaption = cCaption
   ::nTop     = nRow
   ::nLeft    = nCol
   ::nWidth   = nWidth
   ::nHeight  = nHeight
  
   ? '<label id = "'+ ::cVarName + '" '+ ;
    '" style = "' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px; " >' + ;
            ::cCaption +' </label>'    
     
  
   oWnd:AddControl( Self )

return Self


METHOD Activate() CLASS TSay
//  ? "<script>"
//  ? '$( "#' + ::cVarName + '" ).datepicker();'
//  ? "</script>"
   
return nil   