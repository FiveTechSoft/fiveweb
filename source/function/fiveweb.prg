// FiveWeb system functions
// (c) FiveTech Software 2012

#include "FiveWeb.ch"

init procedure WriteHeader()

   if Empty( GetEnv( "GATEWAY_INTERFACE" ) )
      QOut( "Attention: This is a FiveWeb application that has to be executed" )
      QOut( "from the server as a cgi-bin, i.e.:" )
      QOut()
      QOut( "http://server_address/cgi-bin/" + SubStr( hb_ArgV( 0 ), RAt( "\", hb_ArgV( 0 ) ) + 1 ) )
      QOut()
      QOut( "FiveWeb (c) FiveTech Software 2012" )
      QOut( "www.fivetechsoft.com" )
      QOut()
      QUIT
   endif   

   ContentType()
   ? "<html>"
   ? "<head>"
   IncludeScripts()
   IncludeTheme( "trontastic" )
   WinRun()
   ? "</head>"
   ? "<body>"

return

exit procedure WriteTail()

   if ! Empty( GetEnv( "GATEWAY_INTERFACE" ) )
      ? "</body>"
      ? "</html>"
   endif   

return     

function IncludeScripts()

   ? '<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>'
   ? '<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/jquery-ui.min.js"></script>' 
   
return nil   

function IncludeTheme( cTheme )

   /* Available themes:
      base, black-tie, blitzer, cupertino, dark-hive, dot-luv, eggplant, 
      excite-bike, flick, hot-sneaks, humanity, le-frog, mint-choc, overcast,
      pepper-grinder, redmond, smoothness, south-street, start, sunny, swanky-purse, 
      trontastic, ui-darkness, ui-lightness, vader */

   ? '<link type="text/css" rel="stylesheet"' + ;
     ' href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/' + cTheme + ;
     '/jquery-ui.css">'
   
return nil

function WinRun()

   ? "<script>"
   ? "   $(document).ready(function() {"
   ? "   $('#oDlg').dialog();"
   ? "   });"
   ? "</script>"
   
return nil   

function MsgInfo( cMsg )

   ? '<div id="oDlg" class="dialog_window" title="Attention">'
   ? cMsg
   ? "</div>"
   
return nil  

#pragma BEGINDUMP

#include <hbapi.h>

HB_FUNC( CONTENTTYPE )
{
	printf( "Content-Type:text/html\n\n" );
}          

HB_FUNC( CONOUT )
{
   printf( "%s\n", ( char * ) hb_parc( 1 ) );
}   

#pragma ENDDUMP