#include "FiveWeb.ch"

static aMenus := {}

function MenuBegin( cVarName )

   local oPopup

   DEFAULT cVarName := "menu" + AllTrim( Str( Len( aMenus ) + 1 ) )

   oPopup = TMenu():New( cVarName )

   if Len( aMenus ) > 0 
      ATail( ATail( aMenus ):aItems ):oPopup = oPopup
   endif
      
   AAdd( aMenus, oPopup )

return nil

function MenuAddItem( cPrompt, cAction )

   DEFAULT cAction := ""

   ATail( aMenus ):AddItem( TMenuItem():New( cPrompt, cAction ) )

return nil

function MenuEnd()

   if Len( aMenus ) == 1
      aMenus[ 1 ]:Activate( .T. )
   endif   

   ASize( aMenus, Len( aMenus ) - 1 )

return nil