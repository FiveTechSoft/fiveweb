#include "FiveWeb.ch"

function Main()

   local oDlg, oFld
   local cVar1 := Space( 10 ), cVar2 := Space( 20 ), cVar3 := Space( 30 )

   DEFINE DIALOG oDlg TITLE "Using folders"

   @ 10, 10 FOLDER oFld PROMPTS "One", "Two", "Three" OF oDlg SIZE 400, 300

   @ 100, 30 SAY "Tab 1" OF oFld:aDialogs[ 1 ]

   @ 150, 50 GET cVar1 OF oFld:aDialogs[ 1 ]

   @ 100, 30 SAY "Tab 2" OF oFld:aDialogs[ 2 ]

   @ 150, 50 GET cVar2 OF oFld:aDialogs[ 2 ]

   @ 100, 30 SAY "Tab 3" OF oFld:aDialogs[ 3 ]

   @ 150, 50 GET cVar3 OF oFld:aDialogs[ 3 ]

   ACTIVATE DIALOG oDlg

return nil