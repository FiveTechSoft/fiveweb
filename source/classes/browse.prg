#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TBrowse FROM TControl

   DATA cUrl
   DATA cAlias
   DATA cClassTable
   DATA cClassHead
   DATA cClassLine
   DATA aArrayData
   DATA lZebra
   DATA cAction
    
   CLASSDATA nControls INIT 1

   METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl, aValues )

   METHOD CreateFromCode()

   METHOD Activate( lScript )

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( nRow, nCol, nWidth, nHeight, oWnd, cVarName, cUrl, aValues ) CLASS TBrowse

   DEFAULT cVarName := "oBrw" + AllTrim( Str( ::nControls++ ) )

   ::Super:New( nRow, nCol, nWidth, nHeight, cVarName, oWnd )

   ::cUrl   = cUrl
   ::cAlias = Alias()   
   ::lZebra := .T.
  
   ::cClassTable= "browse"
   ::aArrayData = aValues

   ::CreateFromCode()

return Self

//----------------------------------------------------------------------------//

METHOD CreateFromCode() CLASS TBrowse

   local x, n
   local cTablestyle := 'style="' + "position: relative; " + ;
                                    "top: " + AllTrim( Str( ::nTop ) ) + "px; " + ;
                                    "left: " + AllTrim( Str( ::nLeft ) ) + "px; " + ;
                                    "width: " + AllTrim( Str( ::nWidth ) ) + "px; " + ;
                                    "height: " + AllTrim( Str( ::nHeight ) ) + "px; "
                                    
   local oQuery

   if ! Empty( ::aArrayData )
   
      do case
         case ValType( ::aArrayData ) == "O"
              oQuery = ::aArrayData
              ::aArrayData = oQuery:FillArray()
      endcase
              
      ::cAlias = "ARRAY"
      nFields = Len( ::aArrayData[ 1 ] )

      ? '<div class="scroll">'

      ? '<table id="'+ ::cVarName + '" ' + ;
        if( Empty( ::cClassTable ), '', 'class="' + ::cClassTable + '"' ) + ;
        cTableStyle + '>'

      ? '<thead>'
      
      ? '<tr>'

      if ! Empty( oQuery ) 
         ? "<th> </th>" // left checkbox header
         for n = 1 to nFields
            ? '<th>'+ oQuery:FieldName( n ) + "</th>"
         next
      endif   
        
      ? '</tr>'
      ? '</thead>'
      ? '<tbody>'
     
      for x = 1 to Len( ::aArrayData )
         if ::lZebra
            if x % 2 == 0
               ? "<tr class='odd' " + ;
                 " onMouseOver=" + '"' + "this.className='over'" + '"' + ;
                 " onMouseOut=" + '"' + "this.className='odd'" + '"' + '>' 
            else
               ? "<tr class='even' " + ; 
                 " onMouseOver=" + '"' + "this.className='over'" + '"' + ;
                 " onMouseOut=" + '"' + "this.className='even'" + '"' + '>'
            endif 
         else
         endif

           ? "<td width=30px;><input type='checkbox' name='" + AllTrim( Str( x ) ) + ;
             "' onclick=" + '"' + "toggleRowSelected( this )" + '" >' + "</td>"                

           for n = 1 to nFields
               ? '<td ' + ;
                 if( Empty( ::cAction ), '', ' onDblClick="' + "document.location = '" + ;
                 ( AppName() ) + "?" + ::cAction + ":" + AllTrim( Str( x ) ) + ":" + ;
                 AllTrim( Str( n ) ) + "'" + '"' ) + ;
                 ' >' + cValToChar( ::aArrayData[ x, n ] ) + "</td>"
           
           next
         
           ? '</tr>'
          
        next
        ? '</tbody>'
        ? '</table>'
        ? '</div>'
    else

      if Empty( ::cAlias )

         ? '<div id="'+ ::cVarName + '" ' + ;
           cTableStyle + ' >'

         ? '</div>'

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
         x = 1   
        
         while ! EoF()
            ? '<tr>'
            x++
            for n = 1 to FCount()
               ? '<td style="border-bottom: 1px solid #95bce2; padding: 6px 11px;"'+;
                 if(Empty(::cAction),'', ' onDblClick="'+"document.location = '"+(appname())+"?"+::cAction+":"+alltrim(str(x))+":"+alltrim(str(n )) +"'" +'"' )+;
                 ' >'+ FieldGet( n )+ "</td>"                      
            next
            ? '</tr>'
            SKIP
         end   
        
         ? '</table>'
      endif
   endif

return nil

//----------------------------------------------------------------------------//

METHOD Activate( lScript ) CLASS TBrowse

   DEFAULT lScript := .T.

   if Empty( ::cAlias ) 
      if lScript
         ? "<script>"
      endif
      
      ? '$( "#' + ::cVarName + '" ).load( "' + ::cUrl + '" );'
      
      if lScript
         ? "</script>"
      endif   
   endif   
   
return nil

//----------------------------------------------------------------------------//    
