#include "FiveWeb.ch"

function Main()

   MainMenu()

   Edit( "Edit field",;
         { "Name", "Type", "Length", "Decimals" },;
         { Space( 20 ), { "C", "N", "D", "L", "M" }, 0, 0 } )

   Footer()          

return nil