#include "FiveWeb.ch"

function Main( cParams )

   if pcount() > 0
      Process( cParams )
      return nil
   endif

   ShowDialog()

return nil

//----------------------------------------------------------------------------//

function ShowDialog()

   local oDlg
   local oGetFirst, cFirst := Space( 30 )
   local oGetSecond, cSecond := Space( 30 )
   local oGetThird, cThird := Space( 30 )
   local oGetFourth, cFourth := Space( 30 )

   DEFINE DIALOG oDlg TITLE "FiveWeb data entry test" ;
      SIZE 550, 500
      
   @ 40, 31 SAY "first:" SIZE 110, 40 OF oDlg

   @ 105, 31 SAY "second:" SIZE 110, 40 OF oDlg

   @ 170, 31 SAY "third:" SIZE 110, 40 OF oDlg

   @ 234, 30 SAY "fourth:" SIZE 110, 40 OF oDlg

   @ 39, 162 GET oGetFirst VAR cFirst SIZE 300, 40 OF oDlg

   @ 106, 162 GET oGetSecond VAR cSecond SIZE 300, 40 OF oDlg

   @ 169, 161 GET oGetThird VAR cThird SIZE 300, 40 OF oDlg

   @ 235, 162 GET oGetFourth VAR cFourth SIZE 300, 40 OF oDlg

   @ 372, 73 BUTTON "Save" SIZE 110, 40 OF oDlg ;
      ACTION ( 'document.location = "' + '?save:" + ' + ;
               'document.getElementById( "oGetFirst" ).value.trim() + ":" + '+ ;
               'document.getElementById( "oGetSecond" ).value.trim() + ":" + '+ ;
               'document.getElementById( "oGetThird" ).value.trim() + ":" + '+ ;
               'document.getElementById( "oGetFourth" ).value.trim() ' ) // processed in the browser

   @ 372, 209 BUTTON "Review" SIZE 110, 40 OF oDlg ;
      ACTION 'document.location = "' + '?review:data.txt"'

   @ 372, 341 BUTTON "Exit" SIZE 110, 40 OF oDlg ;
      ACTION ( oDlg:End() )  // ( ... ) means processed in advance in the server

   ACTIVATE DIALOG oDlg

return nil

//----------------------------------------------------------------------------//

function Process( cParams )

   local aParams := hb_aTokens( cParams, ":" )
  
   do case
      case aParams[ 1 ] == "save"
           Save( aParams ) 
           ShowDialog()
           
      case aParams[ 1 ] == "review"
           ? MemoRead( "data.txt" )
  end case

return nil           

//----------------------------------------------------------------------------//

function Save( aParams )

   local cData := "", n
   
   for n = 2 to Len( aParams )
      cData += aParams[ n ] + CRLF
   next   

   if ! Empty( aParams )
      MemoWrit( "data.txt", cData )
   endif
   
return nil   

//----------------------------------------------------------------------------//
