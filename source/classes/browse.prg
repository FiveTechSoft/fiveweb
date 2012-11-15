#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TBrowse FROM TControl

   DATA cUrl
   DATA cAlias
   DATA nRowHeight
   DATA nHeadHeight
   DATA cClassTable
   DATA cClassHead
   DATA cClassLine
   DATA aDatos
   DATA lZebra
    
   CLASSDATA nControls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl )

   METHOD CreateFromCode()

   METHOD DefineZebra()
   
   METHOD Activate()

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl, aDatos, nRowHeight ,nHeadHeight ) CLASS TBrowse
local n,x , nFields

   DEFAULT cVarName := "oBrw" + AllTrim( Str( ::nControls++ ) )
   DEFAULT nRowHeight := 25
   DEFAULT nHeadHeight := 60

   Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )

   ::cUrl   = cUrl
   ::cAlias = Alias()   
   ::nRowHeight = nRowHeight
   ::nHeadHeight = nHeadHeight
   ::lZebra := .f.

   ::cClassTable= "browse"
 //  ::cClassLine = "linea" 
 //  ::cClassHead ="boxtitulo"
   ::aDatos = aDatos


return Self

//----------------------------------------------------------------------------//

METHOD DefineZebra() CLASS TBrowse

?'<style type="text/css">'
?'<!-- '

?' .zebra1 { '
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
?'	background-color:#fff;'
?'}'

?' .zebra2 { '
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
?'	background-color:#ecf6fc ;'
?'}'

?'-->'
? '</style>'

Return nil

//----------------------------------------------------------------------------//

METHOD CreateFromCode() CLASS TBrowse

local cTablestyle := 'style="' + "position: absolute; " + ;
                                 "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
                                 "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ;
                                 "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ;
                                 "height: " + AllTrim( Str( ::nHeight ) ) + "px; " + ;
                      'overflow: auto;" '

  if !Empty( ::aDatos )

       ::cAlias:="ARRAY" 
       nFields:= len( ::aDatos[1] )

      ? '<table id="'+ ::cVarName + '" ' + ;
        if( Empty(::cClassTable),'', 'class="'+::cClassTable+'"') + ;
         cTableStyle + ' >'

      ? '<thead>'
      
      ? '<tr'+;
           if( Empty(::cClassHead),'', ' class="'+::cClassHead+'"') + ;
        ' height="'+alltrim(str(::nHeadHeight))+'" >'

        for n = 1 to nFields
          ? '<th>'+ ::aDatos[1,n ] + "</th>"
        next
        
      ? '</tr>'
      ? '</thead>'
      ? '<tbody>'
      
       for x = 2 to len( ::aDatos )
        

        if ::lZebra
           ::DefineZebra()
       ? '<tr '+;
             ' height="'+alltrim(str(::nRowHeight))+'" '+;
            if(x%2==0,' class="zebra1" ', ' class="zebra2" ' )  +' >'

         else
           ? '<tr '+ ;
              if( Empty(::cClassLine),'', ' class="'+::cClassLine+'"') + ;
            ' height="'+alltrim(str(::nRowHeight))+'" >'

         endif

         for n = 1 to nFields
            ? '<td style="border-bottom: 1px solid #95bce2; padding: 6px 11px;" >'+;
                 ::aDatos[x,n] + "</td>"
          next
         
          ? '</tr>'
          
        next
        ? '</tbody>'
        ? '</table>'

   else

   if Empty( ::cAlias )

      ? '<div id="'+ ::cVarName + '" ' + ;
        cTableStyle + ' >'

      ?'</div>'

   else  
   
      ? '<table id="'+ ::cVarName + '" ' + ;
        if( Empty(::cClassTable),'', 'class="'+::cClassTable+'"') + ;
           cTableStyle + ' >'      

        GO TOP 
        ? "<tr>"
        for n = 1 to FCount()
           ? "<th>" + FieldName( n ) + "</th>"
        next
        ? "</tr>"
           
        while ! EoF()
           ? '<tr>'
           for n = 1 to FCount()
              ? "<td>" + FieldGet( n ) + "</td>"
           next
           ? '</tr>'
           SKIP
        end   
        
        ? '</table>'
    endif

  endif


return nil

//----------------------------------------------------------------------------//

METHOD Activate() CLASS TBrowse

   if Empty( ::cAlias ) 
      ? "<script>"
      ? '$( "#' + ::cVarName + '" ).load( "' + ::cUrl + '" );'
      ? "</script>"
   endif   
   
return nil

//----------------------------------------------------------------------------//    
