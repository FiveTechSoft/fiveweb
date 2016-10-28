#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TMenu

   DATA  aItems INIT {}
   DATA  cVarName
   DATA  oPopup

   METHOD New( cVarName )
   
   METHOD AddItem( oItem ) INLINE AAdd( ::aItems, oItem )

   METHOD Activate( lMain, nLevel )

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( cVarName ) CLASS TMenu

   ::cVarName = cVarName
   
return Self   

//----------------------------------------------------------------------------//

METHOD Activate( lMain, nLevel ) CLASS TMenu

   local oItem

   DEFAULT lMain := .F., nLevel := 1

   if ! lMain 
      ? Space( 3 * ( nLevel - 1 ) ) + "<ul>"
   else   
      ? '<div id="' + ::cVarName + '" oncontextmenu="MenuBar( this ); return false;" style="width:100%">'
      ? '<ul class="nav">'
   endif
   
   for each oItem in ::aItems  
      oItem:Activate( lMain, nLevel )
   next
   
   ? Space( 3 * ( nLevel - 1 ) ) + "</ul>"
   
   if lMain
      ? '<div class="clear"></div>'
      ? '</div>'
   endif   
   
return nil      

//----------------------------------------------------------------------------//

function MainMenu()

   ? '<nav class="navbar navbar-inverse">'
   ?    '<div class="container-fluid">'
   ?       '<div class="navbar-header">'
   ?           '<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">'
   ?              '<span class="icon-bar"></span>'
   ?              '<span class="icon-bar"></span>'
   ?              '<span class="icon-bar"></span>'
   ?           '</button>'
   ?           '<a class="navbar-brand" href="#">FiveWeb</a>'
   ?        '</div>'
   ?        '<div class="collapse navbar-collapse" id="myNavbar">'
   ?           '<ul class="nav navbar-nav">'
   ?              '<li class="dropdown">'
   ?              '   <a class="dropdown-toggle" data-toggle="dropdown" href="#">Interface<span class="caret"></span></a>'
   ?              '   <ul class="dropdown-menu">'
   ?              '      <li><a href="#">Menus</a></li>'
   ?              '      <li><a href="#">Forms</a></li>'
   ?              '      <li><a href="#">Browses</a></li>'
   ?              '   </ul>'
   ?              '</li>'
   ?              '<li class="dropdown">'
   ?              '   <a class="dropdown-toggle" data-toggle="dropdown" href="#">Rules<span class="caret"></span></a>'
   ?              '   <ul class="dropdown-menu">'
   ?              '      <li><a href="#">Variables</a></li>'
   ?              '      <li><a href="#">Scripts</a></li>'
   ?              '   </ul>'
   ?              '</li>'
   ?              '<li class="dropdown">'
   ?              '   <a class="dropdown-toggle" data-toggle="dropdown" href="#">Help<span class="caret"></span></a>'
   ?              '   <ul class="dropdown-menu">'
   ?              '      <li><a href="#">Wiki</a></li>'
   ?              '      <li><a href="#">About</a></li>'
   ?              '   </ul>'
   ?              '</li>'
   ?           '</ul>'
   ?           '<ul class="nav navbar-nav navbar-right">'
   ?              '<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>'
   ?              '<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>'
   ?           '</ul>'
   ?        '</div>'
   ?     '</div>'
   ? '</nav>'

return nil

//----------------------------------------------------------------------------//