#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

function Main( cParams )

   local aParams := If( cParams != nil, hb_aTokens( cParams, ":" ), nil )
   local cParam := If( aParams != nil, aParams[ 1 ], "" )

   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/citynight.jpg"
   
   SetTheme( "flick" )
   
   do case
      case cParam == "login"
           CheckLogin( aParams )

      case cParam == "users"
           Users()

      case cParam == "clients"
           Clients()

      otherwise
           Login()

  endcase

return nil

//----------------------------------------------------------------------------//

function Login()

   local oDlg, oImg
   local oGetName, cUserName := Space( 30 )
   local oGetPass, cPassword := ""

   DEFINE DIALOG oDlg TITLE "Login" SIZE 650, 400

   @  30,  30 IMAGE oImg FILENAME "../images/user.png" SIZE 120, 120 OF oDlg

   @  69, 190 SAY "User" SIZE 110, 40 OF oDlg

   @ 124, 190 SAY "Password" SIZE 110, 40 OF oDlg

   @  66, 315 GET oGetName VAR cUserName SIZE 300, 40 OF oDlg

   @ 124, 315 GET oGetPass VAR cPassword SIZE 300, 40 OF oDlg PASSWORD

   @ 265, 189 BUTTON "Ok" SIZE 110, 40 OF oDlg ;
      ACTION ( "document.location = '" + AppName() + "?login:' + " ) + ;
             'oGetName.value + ":" + oGetPass.value'

   @ 265, 335 BUTTON "Cancel" SIZE 110, 40 OF oDlg ;
      ACTION ( oDlg:End() ) // Executed in the server in advance

   ACTIVATE DIALOG oDlg NOWAIT

return nil

//----------------------------------------------------------------------------//

function CheckLogin( aParams )

   // ? aParams[ 2 ]  username
   // ? aParams[ 3 ]  password 
   
   BuildMenu()

return nil

//----------------------------------------------------------------------------//

function BuildMenu()

   local oMenu
   
   MENU oMenu
      MENUITEM "About"
      MENU
         MENUITEM "This app..." ;
            ACTION MsgAbout( "My FiveWeb app", "(c) FiveTech Software" )
      ENDMENU
      
      MENUITEM "Files"
      MENU
         MENUITEM "Users" ;
            ACTION ( 'document.location = "' + AppName() + '?users"' ) 
            
         MENUITEM "Clients" ;
            ACTION ( 'document.location = "' + AppName() + '?clients"' ) 
      ENDMENU
      
      MENUITEM "Operations"
      MENUITEM "Help"
   ENDMENU
   
return oMenu

//----------------------------------------------------------------------------//

function Users()

   local oDlg, oServer, oBrw
   
   BuildMenu()
   
   oServer = TDolphinSrv():New( "mysql.fivetechsoft.net", "fiveweb", "fiveweb" )

   if oServer:hMySQL == nil
      MsgInfo( "can't connect to the database" )
      return nil
   endif
         
   oServer:SelectDB( "fiveweb" )
   
   DEFINE DIALOG oDlg TITLE "Users" SIZE 1000, 600
   
   @ 10, 10 BROWSE oBrw SIZE 900, 100 OF oDlg ;
      ARRAY oServer:Query( "SELECT * FROM users LIMIT 0, 30" )
   
   ACTIVATE DIALOG oDlg NOWAIT
   
   oServer:End()
   
return nil   

//----------------------------------------------------------------------------//

function Clients()

   local oDlg, oServer, oBrw
   
   BuildMenu()
   
   oServer = TDolphinSrv():New( "mysql.fivetechsoft.net", "fiveweb", "fiveweb" )

   if oServer:hMySQL == nil
      MsgInfo( "can't connect to the database" )
      return nil
   endif
         
   oServer:SelectDB( "fiveweb" )
   
   DEFINE DIALOG oDlg TITLE "Clients" SIZE 1200, 650
   
   @ 5, 2 BROWSE oBrw SIZE 1150, 100 OF oDlg ;
      ARRAY oServer:Query( "SELECT * FROM clients LIMIT 0, 30" )
   
   ACTIVATE DIALOG oDlg NOWAIT
   
   oServer:End()
   
return nil   

//----------------------------------------------------------------------------//   