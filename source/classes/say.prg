#include "FiveWeb.ch"

CLASS TSay

   DATA  nTop, nLeft
   DATA  nWidth, nHeight
   DATA  oWnd
   DATA  cVarName 
   DATA cCaption
   DATA cUrl
   DATA cTitle

   CLASSDATA nBtns INIT 1

   METHOD New( nRow, nCol, cCaption, nWidth, nHeight, oWnd, cVarName,cURL,ctitle )

   METHOD Activate()

ENDCLASS


METHOD New( nRow, nCol, cCaption, nWidth, nHeight, oWnd, cVarName,cUrl,cTitle ) CLASS TSay

   DEFAULT cVarName := "oSay" + AllTrim( Str( ::nBtns++ ) )
   DEFAULT nWidth := Len( cCaption ) * 9, nHeight := 40
      
   ::cVarName = cVarName
   ::cCaption = cCaption
   ::nTop     = nRow
   ::nLeft    = nCol
   ::nWidth   = nWidth
   ::nHeight  = nHeight
   ::cUrl    = cUrl
   ::cTitle   = cTitle
   
       
  ? if( Empty(::cUrl ), '<label id = "', '<a id = "' )+;
    ::cVarName + '" '+ ;
    'style = "' + 'position: absolute; ' + ;
    'top: ' + AllTrim( Str( ::nTop ) ) + 'px; ' + ;
    'left: ' + AllTrim( Str( ::nLeft ) ) + 'px; ' + ; 
    'width: ' + AllTrim( Str( ::nWidth ) ) + 'px; ' + ; 
    'height: ' + AllTrim( Str( ::nHeight ) ) + 'px;" ' +;
    'title="'+ ::cTitle+'" '+;
    if(empty(::cUrl ),'', 'href="'+::cUrl+'"')+;
    ' > '
    
  ? ::cCaption 
  ? if( Empty(::cUrl ),  ' </label>' ,  ' </a>'   ) 

  oWnd:AddControl( Self )

return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TSay
//  ? "<script>"
//  ? '$( "#' + ::cVarName + '" ).datepicker();'
//  ? "</script>"
   
return nil   
