// A RAD for the web

#include "FiveWeb.ch"

static oServer

//----------------------------------------------------------------------------//

function Main( cParams )

   local aParams := If( cParams != nil, hb_aTokens( cParams, ":" ), nil )
   local cParam := If( aParams != nil, aParams[ 1 ], "" )

   // SET BACKIMAGE TO "https://bitbucket.org/fivetech/screenshots/downloads/office.bmp"

   MainMenu()

   do case
      case cParam == "menu"
           QuickBrowse( "menu" )

      case cParam == "forms"
           QuickBrowse( "forms" )

      case cParam == "browses"
           QuickBrowse( "browses" )

      case cParam == "vars"
           QuickBrowse( "vars" )

      case cParam == "scripts"
           QuickBrowse( "scripts" )

   endcase

   Footer()

return nil

//----------------------------------------------------------------------------//

function QuickBrowse( cTableName )
                                             // username         // password
   oServer = TDolphinSrv():New( "127.0.0.1", "fivetech_fivegen", "fivetech_fivegen" )

   oServer:SelectDB( "fivetech_fivegen" ) 

   ? '<h2>Browse ' + cTableName + '</h2>'  

   BrowseQuery( oServer:Query( "SELECT * FROM " + cTableName ) )

return nil

//----------------------------------------------------------------------------//