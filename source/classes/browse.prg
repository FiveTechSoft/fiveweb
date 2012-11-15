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
    
   CLASSDATA nControls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl )

   METHOD CreateFromCode()
   
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
   
   ::cClassTable= "browse"
 //  ::cClassLine = "linea" 
 //  ::cClassHead ="boxtitulo"
   ::aDatos = aDatos
  
return Self

//----------------------------------------------------------------------------//

METHOD CreateFromCode() CLASS TBrowse

local cTablestyle := 'style="' + "position: absolute; " + ;
                                 "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
                                 "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ;
                                 "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ;
                                 "height: " + AllTrim( Str( ::nHeight ) ) + "px; " + ;
                      'overflow: auto;" '

  if !Empty( ::aDatos )

     ? '<link rel="stylesheet" href="/estilo2/emx_nav_left.css" type="text/css">'

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
         ? '<tr '+;
         if( Empty(::cClassLine),'', ' class="'+::cClassLine+'"') + ;
         ' height="'+alltrim(str(::nRowHeight))+'" >'
         
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
