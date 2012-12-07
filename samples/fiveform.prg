// FiveWeb forms designer

#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

function Main()

   local oDlg

   BuildMenu()

   DEFINE DIALOG oDlg SIZE 600, 400

   ACTIVATE DIALOG oDlg NOWAIT  

return nil

//----------------------------------------------------------------------------//

function BuildMenu()

   local oMenu

   MENU oMenu
      MENUITEM "Controls"
      MENU
         MENUITEM "Add control"
         MENU 
            MENUITEM "Say"      ACTION AddSay( "oDlg" )
            MENUITEM "Get"      ACTION AddGet( "oDlg" )
            MENUITEM "Button"   ACTION AddButton( "oDlg" )
            MENUITEM "Progress" ACTION AddProgress( "oDlg" )
            MENUITEM "Browse"   ACTION AddBrowse( "oDlg" )
            MENUITEM "Folder"   ACTION AddFolder( "oDlg" )
         ENDMENU
         
         MENUITEM "Position"
         MENU 
            MENUITEM "Center horizontally" ACTION CenterHorizontally()
            MENUITEM "Center vertically"   ACTION CenterVertically()
         ENDMENU

         MENUITEM "Delete" ACTION DelControl()
      ENDMENU  
      
      MENUITEM "Source"
      MENU 
         MENUITEM "FiveWeb" ACTION GenCode( "oDlg" )
         MENUITEM "HTML"    ACTION ShowHTML( "oDlg" )
      ENDMENU

      MENUITEM "Preferences"
      MENU 
         MENUITEM "Main theme"
         MENU
            MENUITEM "Light"
            MENU 
               MENUITEM "Aristo"       ACTION SetAristoTheme()
               MENUITEM "Base"         ACTION SetTheme( "base" )
               MENUITEM "Black-tie"    ACTION SetTheme( "black-tie" )
               MENUITEM "Blitzer"      ACTION SetTheme( "blitzer" )
               MENUITEM "Bootstrap"    ACTION SetBootstrapTheme()
               MENUITEM "Cupertino"    ACTION SetTheme( "cupertino" )
               MENUITEM "excite-bike"  ACTION SetTheme( "excite-bike" )
               MENUITEM "flick"        ACTION SetTheme( "flick" )
               MENUITEM "hot-sneacks"  ACTION SetTheme( "hot-sneaks" )
               MENUITEM "humanity"     ACTION SetTheme( "humanity" )
               MENUITEM "overcast"     ACTION SetTheme( "overcast" )
               MENUITEM "pepper-grinder" ACTION SetTheme( "pepper-grinder" )
               MENUITEM "redmond"      ACTION SetTheme( "redmond" )
               MENUITEM "smoothness"   ACTION SetTheme( "smoothness" )
               MENUITEM "south-street" ACTION SetTheme( "south-street" )
               MENUITEM "start"        ACTION SetTheme( "start" )
               MENUITEM "sunny"        ACTION SetTheme( "sunny" )
               MENUITEM "ui-lightness" ACTION SetTheme( "ui-lightness" )
            ENDMENU
         
            MENUITEM "Dark"
            MENU 
               MENUITEM "Dot-lub"      ACTION SetTheme( "dot-luv" )
               MENUITEM "Dark-hive"    ACTION SetTheme( "dark-hive" )
               MENUITEM "Eggplant"     ACTION SetTheme( "eggplant" )
               MENUITEM "le-frog"      ACTION SetTheme( "le-frog" )
               MENUITEM "mint-choc"    ACTION SetTheme( "mint-choc" )
               MENUITEM "swanky-purse" ACTION SetTheme( "swanky-purse" )
               MENUITEM "trontastic"   ACTION SetTheme( "trontastic" )
               MENUITEM "ui-darkness"  ACTION SetTheme( "ui-darkness" )
               MENUITEM "vader"        ACTION SetTheme( "vader" )
            ENDMENU
         ENDMENU
         
         MENUITEM "Background"
         MENU 
            MENUITEM "Image"
            MENU 
               MENUITEM "Beach"   ACTION SetBackImage( "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg" )
               MENUITEM "Bubbles" ACTION SetBackImage( "http://fiveweb.googlecode.com/svn/trunk/images/bubbles.jpg" )
            ENDMENU
            MENUITEM "Color"
         ENDMENU   
      ENDMENU  

      MENUITEM "Help"
      MENU 
         MENUITEM "Wiki..."  ACTION Go( "http://code.google.com/p/fiveweb/w/list" )
         MENUITEM "About..." ACTION MsgInfo( "FiveWeb forms designer" )
      ENDMENU

   ENDMENU

return oMenu

//----------------------------------------------------------------------------//