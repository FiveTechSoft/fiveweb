#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TToolBar FROM TControl

   CLASSDATA nCtrls INIT 1

   METHOD New( oWnd, cVarName )

   METHOD Activate()
   
ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( oWnd, cVarName ) CLASS TToolBar

   DEFAULT cVarName := "oTbr" + AllTrim( Str( ::nCtrls++ ) )
      
   ::Super:New( 0, 0, oWnd:nWidth - 2, 70, cVarName, oWnd )
  
   ? '<div id="'+ ::cVarName + '" ' + ;
     'class="ui-widget-header ui-corner-all" ' + ;
     'style="' + "position: absolute; " + ;
     "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
     "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
     "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
     "height: " + AllTrim( Str( ::nHeight ) ) + 'px;" >' + ;
     "</div>"    
  
return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TToolBar

   local oControl

   for each oControl in ::aControls
      oControl:Activate()
   next   
   
return nil   

//----------------------------------------------------------------------------//
