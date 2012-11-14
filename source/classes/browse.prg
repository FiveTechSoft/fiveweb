#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TBrowse FROM TControl

   DATA cUrl
   DATA cAlias
   DATA nRowHeight

   CLASSDATA nControls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl )

   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl, aDatos, nRowHeight ) CLASS TBrowse
local n,x , nFields

   DEFAULT cVarName := "oSay" + AllTrim( Str( ::nControls++ ) )
   DEFAULT nRowHeight := 25

   Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )

   ::cUrl   = cUrl
   ::cAlias = Alias()   
   ::nRowHeight = nRowHeight

   if !Empty( aDatos )

       ::cAlias:="ARRAY" 
       nFields:= len( aDatos[1] )

      ? '<table id="'+ ::cVarName + '" ' + ;
        'class="browse" ' + ;
        'style="' + "position: absolute; " + ;
        "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
        "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
        "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
        "height: " + AllTrim( Str( ::nHeight ) ) + "px; " + ;
        'overflow: auto;" >'

        
      ? '<tr height="'+alltrim(str(::nRowHeight))+'" >'
        for n = 1 to nFields
           ? "<th>" + aDatos[1,n ] + "</th>"
        next
        ? "</tr>"
           
        for x = 2 to len( aDatos )
          ? '<tr height="'+alltrim(str(::nRowHeight))+'" >'
           for n = 1 to nFields
              ? "<td>" + aDatos[x,n] + "</td>"
           next
           ? "</tr>"
          
        next
        
        ? "</table>"         

   else

   if Empty( ::cAlias )   
      ? '<div id="'+ ::cVarName + '" ' + ;
        'style="' + "position: absolute; " + ;
        "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
        "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
        "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
        "height: " + AllTrim( Str( ::nHeight ) ) + "px; " + ;
        'overflow: auto;" >' + ;
        "</div>"
   else  
   
      ? '<table id="'+ ::cVarName + '" ' + ;
        'class="browse" ' + ;
        'style="' + "position: absolute; " + ;
        "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
        "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ; 
        "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ; 
        "height: " + AllTrim( Str( ::nHeight ) ) + "px; " + ;
        'overflow: auto;" >'

        GO TOP 
        ? "<tr>"
        for n = 1 to FCount()
           ? "<th>" + FieldName( n ) + "</th>"
        next
        ? "</tr>"
           
        while ! EoF()
           ? "<tr>"
           for n = 1 to FCount()
              ? "<td>" + FieldGet( n ) + "</td>"
           next
           ? "</tr>"
           SKIP
        end   
        
        ? "</table>"
    endif

  endif

return Self

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TBrowse

   if Empty( ::cAlias ) 
      ? "<script>"
      ? '$( "#' + ::cVarName + '" ).load( "' + ::cUrl + '" );'
      ? "</script>"
   endif   
   
return nil

//----------------------------------------------------------------------------//    
