#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

CLASS TBrowse FROM TControl

   DATA cUrl
   DATA cAlias
   DATA aValues
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

   ::cUrl    = cUrl
   ::cAlias  = Alias()   
   ::aValues = aValues

   ::CreateFromCode()

return Self

//----------------------------------------------------------------------------//

METHOD CreateFromCode() CLASS TBrowse

   local oQuery, n, m

   ? '<div class="scroll">'
   ? '<table class"table table-hover table-striped" id="' + ::cVarName + '">' // class="browse"
   ? '<tr>'

   if ValType( ::aValues ) == "O"  // Dolphin query
      oQuery = ::aValues
      ::aValues = oQuery:FillArray()
      ? "<th> </th>" // left checkbox header
      for n = 1 to Len( ::aValues[ 1 ] )
         ? '<th>'+ oQuery:FieldName( n ) + "</th>"
      next
   endif   
        
   ? '</tr>'
   ? '<tbody>'

   if ! Empty( ::aValues )
      for n = 1 to Len( ::aValues )
         /*  
         if n % 2 == 0
            ? "<tr class='odd' " + ;
              " onMouseOver=" + '"' + "this.className='over'" + '"' + ;
              " onMouseOut=" + '"' + "this.className='odd'" + '"' + '>' 
         else
            ? "<tr class='even' " + ; 
              " onMouseOver=" + '"' + "this.className='over'" + '"' + ;
              " onMouseOut=" + '"' + "this.className='even'" + '"' + '>'
         endif 
         */

         ? "<td width=30px;><input type='checkbox' name='" + AllTrim( Str( n ) ) + ;
           "' onclick=" + '"' + "toggleRowSelected( this )" + '" >' + "</td>"                

         for m = 1 to Len( ::aValues[ 1 ] )
            ? '<td>' + cValToChar( ::aValues[ n, m ] ) + '</td>'
         next   

         ? '</tr>'
      next
   endif
   
   ? '</tbody>'
   ? '</table>'
   ? '</div>'

return nil

//----------------------------------------------------------------------------//

METHOD Activate( lScript ) CLASS TBrowse

   DEFAULT lScript := .T.

   if ! Empty( ::cUrl )
      if lScript
         ? "<script>"
      endif
      
      if ! Empty( ::cUrl )
         ? '$( "#' + ::cVarName + '" ).load( "' + ::cUrl + '" );'
      endif   
      
      if lScript
         ? "</script>"
      endif   
   endif   
   
return nil

//----------------------------------------------------------------------------//    