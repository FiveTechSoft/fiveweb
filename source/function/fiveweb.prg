// FiveWeb system functions
// (c) FiveTech Software 2012

#include "FiveWeb.ch"

REQUEST HB_GT_STD_DEFAULT
REQUEST HB_GT_STD

static nMsgInfos := 1

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
   // WinRun()
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
   ? '<script src="https://fiveweb.googlecode.com/svn/trunk/source/js/fiveweb.js"></script>'
   
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

   ? '<link type="text/css" rel="stylesheet"' + ;
     ' href="https://fiveweb.googlecode.com/svn/trunk/source/css/styles.css">'
   
return nil

function WinRun()

   ? "<script>"
   ? "   $(document).ready(function() {"
   ? "   $('#oDlg').dialog();"
   ? "   });"
   ? "</script>"
   
return nil   

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

function SetBackColor( cColor )

   ? "<script>"
   ? 'document.body.style.backgroundColor = "' + cColor + '";'
   ? "</script>"
   
return nil   

function SetBackImage( cImage )

   ? "<script>"
   ? 'document.body.style.backgroundImage= = "' + cImage + '";'
   ? "</script>"
   
return nil   

procedure HB_GTSYS
return

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
