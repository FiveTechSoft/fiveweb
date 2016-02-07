#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TControl FROM TWindow

   DATA nTop, nLeft      // position
   DATA nWidth, nHeight  // size
   DATA oWnd             // container
   DATA cVarName         // variable name
   DATA bWhen            // WHEN expression as codeblock

   METHOD New( nTop, nLeft, nWidth, nHeight, cVarName, oWnd )

   METHOD Activate( lScript ) VIRTUAL

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nTop, nLeft, nWidth, nHeight, cVarName, oWnd ) CLASS TControl

   DEFAULT oWnd := GetWndDefault()

   ::nTop     = nTop
   ::nLeft    = nLeft
   ::nWidth   = nWidth
   ::nHeight  = nHeight
   ::cVarName = cVarName
   ::oWnd     = oWnd

   oWnd:AddControl( Self )

return Self

//----------------------------------------------------------------------------//