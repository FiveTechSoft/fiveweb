#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TProgress FROM TControl

   DATA nMin, nMax, nValue

   CLASSDATA nCtrls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, nValue )
   
   METHOD Activate()
   
  METHOD SetStep( nStepInc ) 
 

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, nValue ) CLASS TProgress

   DEFAULT cVarName := "oPrg" + AllTrim( Str( ::nCtrls++ ) ), nValue := 30
      
   Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )
  
   ::nValue = nValue
  
   ? '<div id="'+ ::cVarName + '" ' + ;
     'class="progressbar" ' + ;
     'style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px;" >' + ;
     "</div>"    
  
return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TProgress

   ? "<script>"
   ? '$( "#' + ::cVarName + '" ).progressbar();'
   ? '$( "#' + ::cVarName + '" ).progressbar( "value", ' + Alltrim( Str( ::nValue ) ) + ");"
   ? "</script>"
   
return nil   

//----------------------------------------------------------------------------//

METHOD SetStep( nStepInc ) CLASS TProgress
local cItem
if nStepInc > 0
   cItem:= 'ProgressInc("'+ ::cVarName+'",'+alltrim(str(nStepInc))+' )'
elseif nStepInc < 0
   cItem:= 'ProgressDec("'+ ::cVarName+'",'+alltrim(str(-nStepInc))+' )'
endif 
Return cItem