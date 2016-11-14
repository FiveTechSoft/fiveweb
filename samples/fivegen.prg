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
      // QuickBrowse( cTableName )
      QuickEdit( cTableName, cId )
      QuickBrowse( cTableName )
   else
      if ! Empty( cTableName ) 
         QuickBrowse( cTableName )
      endif   
   endif   

   Footer( cTableName )

return nil

//----------------------------------------------------------------------------//

function QuickEdit( cTableName, cId )

   local oQry

   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   oServer:SelectDB( "fivetech_fivegen" ) 

   oQry = oServer:Query( "SELECT * FROM " + cTableName + " WHERE `id` = " + cId )
   
   EditQueryRow( oQry, cTableName )
   
return nil

//----------------------------------------------------------------------------//

function QuickBrowse( cTableName )

   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   oServer:SelectDB( "fivetech_fivegen" ) 

   ? '<h2>Browse ' + cTableName + '</h2>'  

   BrowseQuery( oServer:Query( "SELECT * FROM " + cTableName ) )

return nil

//----------------------------------------------------------------------------//
