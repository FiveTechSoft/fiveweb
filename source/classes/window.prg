#include "FiveWeb.ch"

static oWndDefault

//----------------------------------------------------------------------------//

CLASS TWindow

   DATA   aControls INIT {}

   METHOD New() INLINE Self

   METHOD Activate()

   METHOD AddControl( oCtrl ) INLINE AAdd( ::aControls, oCtrl ), oCtrl:oWnd := Self, oCtrl

ENDCLASS

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TWindow

   local oControl

   for each oControl in ::aControls
      oControl:Activate()
   next   
   
return nil   

//----------------------------------------------------------------------------//

function GetWndDefault()

   DEFAULT oWndDefault := TWindow():New()

return oWndDefault

//----------------------------------------------------------------------------//