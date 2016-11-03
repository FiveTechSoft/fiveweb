// FiveWeb system functions
// (c) FiveTech Software 2012-2016

#include "FiveWeb.ch"

REQUEST HB_GT_STD_DEFAULT
REQUEST HB_GT_STD

static nMsgInfos := 1

//----------------------------------------------------------------------------//

init procedure WriteHeader()

   local lWindows := At( "\", hb_ArgV( 0 ) ) != 0

   if Empty( GetEnv( "GATEWAY_INTERFACE" ) )
      QOut( "Attention: This is a FiveWeb application that has to be executed" )
      QOut( "from the server as a cgi-bin, i.e.:" )
      QOut()
      QOut( "http://server_address/cgi-bin/" + SubStr( hb_ArgV( 0 ), RAt( If( lWindows, "\", "/" ), hb_ArgV( 0 ) ) + 1 ) )
      QOut()
      QOut( "FiveWeb (c) FiveTech Software 2012-2016" )
      QOut( "www.fivetechsoft.com" )
      QOut()
      QUIT
   endif   

   ContentType()
   ? "<html>"
   ? "<head>"
   IncludeScripts()
   ? "</head>"
   ? "<body>"
   
return

//----------------------------------------------------------------------------//

exit procedure WriteTail()

   if ! Empty( GetEnv( "GATEWAY_INTERFACE" ) )
      ? "</div>"  
      ? "</body>"
      ? "</html>"
   endif   

return     

//----------------------------------------------------------------------------//

function IncludeScripts()

   // Bootstrap
   ? '<meta charset="utf-8">'
   ? '<meta name="viewport" content="width=device-width, initial-scale=1">'
   ? '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">'
   ? '<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>'
   ? '<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>'

   // Fivegen
   ? '<script src="https://bitbucket.org/fivetech/fiveweb/downloads/fiveweb.js"></script>'

return nil   

//----------------------------------------------------------------------------//

function IncludeTheme( cTheme )

   /* Available themes:
      base, black-tie, blitzer, cupertino, dark-hive, dot-luv, eggplant, 
      excite-bike, flick, hot-sneaks, humanity, le-frog, mint-choc, overcast,
      pepper-grinder, redmond, smoothness, south-street, start, sunny, swanky-purse, 
      trontastic, ui-darkness, ui-lightness, vader */

   ? '<link type="text/css" rel="stylesheet"' + ;
     ' href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/' + cTheme + ;
     '/jquery-ui.css">'

   ? '<link type="text/css" rel="stylesheet"' + ;
     ' href="https://bitbucket.org/fivetech/fiveweb/downloads/styles.css">'     
   
return nil

//----------------------------------------------------------------------------//

function WinRun()

   ? "<script>"
   ? "   $(document).ready(function() {"
   ? "   $('#oDlg').dialog();"
   ? "   });"
   ? "</script>"
   
return nil   

//----------------------------------------------------------------------------//

function MsgInfo( cMsg, cTitle )

   DEFAULT cTitle := "Attention"
   
   ? '<div id="oDlg' + AllTrim( Str( nMsgInfos ) ) + '" class="dialog_window" title="' + cTitle + '"><br>'
   ? cMsg
   ? "<span class='ui-icon ui-icon-info' width=40px; height=40px; style='float: left; margin: 0 7px 20px 0;'></span>"
   ? "</div>"
   ? "<script>"
   ? "$( '#oDlg" + AllTrim( Str( nMsgInfos++ ) ) + "' ).dialog( { width: 400, height: 250, " + ;
     "modal: true, " + ;
     "buttons: { 'Ok': function() { $( this ).dialog( 'close' ); } } } );"
   ? "</script>"
   
return nil  

//----------------------------------------------------------------------------//

function SetBackColor( cColor )

   ? "<script>"
   ? 'document.body.style.backgroundColor = "' + cColor + '";'
   ? "</script>"
   
return nil   

//----------------------------------------------------------------------------//

function SetBackImage( cImage )

   ? "<script>"
   ? 'document.body.style.backgroundImage = "url( ' + "'" + cImage + "'" + ' )";'
   ? 'document.body.style.backgroundSize = "100% 100%";'
   ? "</script>"
   
return nil   

//----------------------------------------------------------------------------//

function SetTheme( cTheme )

   ? "<script>"
   ? 'SetTheme( "' + cTheme + '" );'
   ? "</script>"

return nil

//----------------------------------------------------------------------------//

procedure HB_GTSYS
return

//----------------------------------------------------------------------------//

#pragma BEGINDUMP

#include <hbapi.h>

HB_FUNC( CONTENTTYPE )
{
   printf( "Content-Type: text/html\n\n" );
}          

HB_FUNC( CONOUT )
{
   printf( "%s\n", ( char * ) hb_parc( 1 ) );
}   

#pragma ENDDUMP

//----------------------------------------------------------------------------//