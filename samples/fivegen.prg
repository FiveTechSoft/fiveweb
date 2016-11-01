// A RAD for the web

#include "FiveWeb.ch"

static oServer

//----------------------------------------------------------------------------//

function Main( cParams )

   local aParams    := If( cParams != nil, hb_aTokens( cParams, ":" ), nil )
   local cTableName := If( aParams != nil, aParams[ 1 ], "" )
   local cAction    := If( aParams != nil .and. Len( aParams ) > 1, aParams[ 2 ], "" )
   local cId        := If( aParams != nil .and. Len( aParams ) > 2, aParams[ 3 ], "" )

   MainMenu()

   if cAction == "edit"
      QuickEdit( cTableName, cId )
   else
      if ! Empty( cTableName ) 
         QuickBrowse( cTableName )
      endif   
   endif   

   Footer()

return nil

//----------------------------------------------------------------------------//

function QuickEdit( cTableName, cId )

   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   oServer:SelectDB( "fivetech_fivegen" ) 

   BrowseQuery( oServer:Query( "SELECT * FROM " + cTableName + " WHERE `id` = " + cId ) )
   
return nil

//----------------------------------------------------------------------------//

function QuickBrowse( cTableName )

   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   oServer:SelectDB( "fivetech_fivegen" ) 

   ? '<h2>Browse ' + cTableName + '</h2>'  

   BrowseQuery( oServer:Query( "SELECT * FROM " + cTableName ) )

return nil

//----------------------------------------------------------------------------//