#include "FiveWeb.ch"


//----------------------------------------------------------------------------//

function Main( cParams )

   local oDlg, oGet1, oGet2, oGet3 
   local cTitle := Space( 80 ), cFamilien := Space( 80 ), cVorname := Space( 80 )
   local AppName:= AppName()

   SET BACKIMAGE TO "http://fiveweb.googlecode.com/svn/trunk/images/beach.jpg"
   
   SetTheme( "flick" )
   
   BuildMenu()

   if pcount() > 0
      Process( cParams )
      return nil
   endif

   DEFINE DIALOG oDlg TITLE "Otto example" SIZE 600, 400
   
   @ 12, 10 SAY "Title:" OF oDlg

   @ 10, 160 GET oGet1 VAR cTitle OF oDlg SIZE 300, 35

   @ 54, 10 SAY "FamilienName:" OF oDlg

   @ 52, 160 GET oGet2 VAR cFamilien OF oDlg SIZE 300, 35

   @ 94, 10 SAY "Vorname:" OF oDlg

   @ 90, 160 GET oGet3 VAR cVorname OF oDlg SIZE 300, 35

   @ 260, 160 BUTTON "Ok" OF oDlg ;
      ACTION document.location = "otto.exe?add:" + ;
                                 document.getElementById( "oGet1" ).value + ":" + ;
                                 document.getElementById( "oGet2" ).value + ":" + ;
                                 document.getElementById( "oGet3" ).value

   @ 260, 300 BUTTON "Cancel" OF oDlg

   ACTIVATE DIALOG oDlg NOWAIT

return nil



//----------------------------------------------------------------------------//

function BuildMenu()
local AppName := AppName()
   local oMenu

   MENU oMenu
      MENUITEM "Clients"
      MENU 
         MENUITEM "Add"    ACTION ('document.location = "'+appname()+'" ')
         MENUITEM "Browse" ACTION ('document.location = "'+appname()+'?browse"')
      ENDMENU

      MENUITEM "About"
      MENU 
         MENUITEM "Wiki"
      ENDMENU
   ENDMENU

return oMenu

//----------------------------------------------------------------------------//

function Process( cParams )
   local i
   local aParams := hb_aTokens( cParams, ":" )
  
   do case
      case aParams[ 1 ] == "add"
           Add( aParams )

      case aParams[ 1 ] == "browse"
           Browse()
     
      case aParams[ 1 ] == "edit"
         
           Edit( aParams ) 
     
     case aParams[ 1 ] == "Edita"
           edita( aParams ) 
     
     case aParams[ 1 ] == "clickbrw"
           clickbrw (aParams )
  end case


return nil           

//----------------------------------------------------------------------------//

function Add( aParams )

   if ! File( "clients.dbf" )
      DbCreate( "clients.dbf", { { "title",   "C", 10, 0 },;
                                 { "family",  "C", 80, 0 },;
                                 { "vorname", "C", 80, 0 },;
                                 { "user_ip", "C", 20, 0 } } )
   endif
   
   USE clients SHARED
   
   APPEND BLANK
   
   if RLock()
      clients->title   := aParams[ 2 ]
      clients->family  := aParams[ 3 ]
      clients->vorname := aParams[ 4 ]
      clients->user_ip := GetEnv( "REMOTE_ADDR" )
      DbUnLock()
   endif    

   Browse()

return nil
//----------------------------------------------------------------------------// 
function Edit( aParams )
      
   
local nRecno:=val(aParams[ 5 ])
 
    USE clients SHARED 
    dbgoto( nRecno )
 
   if RLock()
      clients->title   := aParams[ 2 ]
      clients->family  := aParams[ 3 ]
      clients->vorname := aParams[ 4 ]
      clients->user_ip := GetEnv( "REMOTE_ADDR" )
      DbUnLock()
   endif    

   USE
   Browse()

return nil



//----------------------------------------------------------------------------// 

Function DefineClassLine()

 ?'<style type="text/css">'
 ?'<!-- '
 ?'.linea {	font-family: Verdana, Arial, Helvetica, sans-serif;'
 ?'	font-size: 13px;color: #333333;	background-color: transparent;'
 ?'}'
 ?'-->'
 ? '</style>'
Return nil

Function DefineClassHead()

 ?'<style type="text/css">'
 ?'<!-- '

?' .boxtitulo { '
?'	background-image: url(glbnav_background.gif);'
?'	background-position: 4px;'
?'	border-bottom-color: #333333;'
?'	border-bottom-style: solid;'
?'	border-bottom-width: 1px;'
?'	border-left-color: #333333;'
?'	border-left-style: solid;'
?'	border-left-width: 1px;'
?'	border-right-color: #000000;'
?'	border-right-style: solid;'
?'	border-right-width: 1px;'
?'	border-top-color: #333333;'
?'	border-top-style: solid;'
?'	border-top-width: 1px;'
?'	color: #333333;'
?'	background-color:#a5beb5 ;'
?'	font-family: Verdana, Arial, Helvetica, sans-serif;'
?'	font-size: 12px;'
?'	font-weight: bold;'
?'	height: 18px;'
?'	text-align: center;'

 ?'}'

 ?'-->'
 ? '</style>'

Return nil

//----------------------------------------------------------------------------// 

Function clickbrw(aParams)
local aDatos:= {}
local cfun:= aParams[ 1 ]
local x:= val(aParams[ 2 ])
local n:= val(aParams[ 3 ])
local cName
local oDlg
local AppName := AppName()



USE clients SHARED


aadd( aDatos, {"title","Family","Vorname"} )

go top
do while !eof()
aadd(aDatos,{clients->title, clients->family,clients->vorname })
skip
enddo

USE

cName:= aDatos[ x ,n ]

DEFINE DIALOG oDlg TITLE "Otto example" SIZE 600, 400

@ 12, 10 SAY "Title:" OF oDlg

@ 12, 80 SAY cName  OF oDlg

@ 260, 300 BUTTON "Cancel" OF oDlg ACTION ('document.location = "'+appname()+'?browse"')

ACTIVATE DIALOG oDlg NOWAIT


Return nil


//----------------------------------------------------------------------------//

function Browse()

   local oDlg, oBrw

   local aDatos:={}

   if ! File( "clients.dbf" )
      DbCreate( "clients.dbf", { { "title",   "C", 10, 0 },;
                                 { "family",  "C", 80, 0 },;
                                 { "vorname", "C", 80, 0 } } )
   endif
   
   USE clients SHARED

   aadd( aDatos, {"title","Family","Vorname"} )
   
   go top
   do while !eof()
      aadd(aDatos,{clients->title, clients->family,clients->vorname })
      skip
   enddo

   USE
  
   DefineClassLine()
   DefineClassHead()  
   
   DEFINE DIALOG oDlg TITLE "Clients browse" SIZE 800, 600
   

   @ 10, 10 BROWSE oBrw SIZE 500, 400 OF oDlg ARRAY aDatos

  //  oBrw:cAction= "clickbrw"
  
    oBrw:cAction:= "Edita"

    oBrw:cClassTable:= "" //"browse"
    oBrw:cClassLine:="linea"
    obrw:cClassHead:= "boxtitulo"
    oBrw:lZebra:= .t.

    oBrw:CreateFromCode()

   
   ACTIVATE DIALOG oDlg NOWAIT
   
   

return nil

//----------------------------------------------------------------------------//                                  

function Edita(aParams)
 local nRecno:= val(aParams[ 2 ])-1
 local oDlg, oGet1, oGet2, oGet3 ,oGet4
 local cTitle , cFamilien , cVorname 
 local cRecno:= alltrim(str(nRecno))
   
   USE clients SHARED
   dbgoto(nRecno) 
     
   cTitle:=   clients->title 
   cFamilien := clients->family
   cVorname  := clients->vorname 
   
      
   DEFINE DIALOG oDlg TITLE "Edición registros" SIZE 600, 400
   
   @ 12, 10 SAY "Title:" OF oDlg

   @ 10, 160 GET oGet1 VAR cTitle OF oDlg SIZE 300, 35

   @ 54, 10 SAY "FamilienName:" OF oDlg

   @ 52, 160 GET oGet2 VAR cFamilien OF oDlg SIZE 300, 35

   @ 94, 10 SAY "Vorname:" OF oDlg

   @ 90, 160 GET oGet3 VAR cVorname OF oDlg SIZE 300, 35
   
    @ 9, 190 GET oGet4 VAR cRecno OF oDlg SIZE 300, 35 HIDE
   

   @ 260, 160 BUTTON "Ok" OF oDlg ;
      ACTION ('document.location = "'+appname()+'?edit:"+' + ;
                                  'document.getElementById( "oGet1" ).value.trim() + ":" + '+ ;
                                  'document.getElementById( "oGet2" ).value.trim() + ":" + '+ ;
                                  'document.getElementById( "oGet3" ).value.trim() + ":" + '+ ;
                                  'document.getElementById( "oGet4" ).value.trim() ' )


 
   @ 260, 300 BUTTON "Cancel" OF oDlg
   

   ACTIVATE DIALOG oDlg NOWAIT
   
           
   USE

return nil

//----------------------------------------------------------------------------//      