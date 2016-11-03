#include "FiveWeb.ch"

//----------------------------------------------------------------------------//

function EditQueryRow( oQuery, cTableName )

   local aValues := oQuery:FillArray() 
   local aHeaders := {}, aRow := {}
   
   for n = 1 to Len( aValues[ 1 ] )
      AAdd( aHeaders, oQuery:FieldName( n ) )
      AAdd( aRow, aValues[ 1, n ] )
   next   

   Edit( "Edit " + cTableName, aHeaders, aRow )
   
return nil

//----------------------------------------------------------------------------//

function Edit( cTitle, aLabels, aValues )

   local n, m

   ? '<div class="modal fade" id="oDlg" role="dialog">'
   ? '<div class="modal-dialog">'
   ? '<div class="modal-content">'
   
   ? '<div class="modal-header">'
   ? '<button type="button" class="close" data-dismiss="modal">&times;</button>'
   ? '<h4 class="modal-title">' + cTitle + '</h4>'
   ? '</div>'
   
   ? '<div class="modal-body">'
   ? '<form class="form-horizontal">'
   
   for n = 1 to Len( aLabels )
      ? '<div class="form-group">'
      ? '<label class="col-sm-2 control-label">' + aLabels[ n ] + '</label>'
      ? '<div class="col-sm-10">'
      
      do case
         case ValType( aValues[ n ] ) == "A"
            ? '<select id="' + aLabels[ n ] + '" class="form-control">'
            for m = 1 to Len( aValues[ n ] ) 
               ? '<option>' + cValToChar( aValues[ n, m ] ) + '</option>'
            next   
            ? '</select>'
         
         case ValType( aValues[ n ] ) == "L"
            ? '<select id="' + aLabels[ n ] + '" class="form-control">'
            ? '<option' + If( aValues[ n ], " selected", "" ) + '>Yes</option>'
            ? '<option' + If( aValues[ n ], " selected", "" ) + '>No</option>'
            ? '</select>'
         otherwise
            ? '<input class="form-control" id="' + aLabels[ n ] + '" type="text" value="' + ;
              cValToChar( aValues[ n ] ) + '">'
      endcase
      
      ? '</div>'
      ? '</div>'
   next
   
   ? '</form>'
   ? '</div>'

   ? '<div class="modal-footer">'
   ? '<button type="button" class="btn btn-success" data-dismiss="modal">Save</button>'
   ? '<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>'
   ? '</div>'

   ? '</div>'
   ? '</div>'
   ? '</div>'

   ? "<script>$('#oDlg').modal('show');</script>"

return nil

//----------------------------------------------------------------------------//

function Footer( cTableName )

   ? '<div id="footer">'
   ?   '<div class="col-xs-16 navbar-inverse navbar-fixed-bottom">'
   ?      '<div class="row" id="bottomNav">'
   ?         '<div class="col-xs-4 text-center" style=width:25%;><a href="#"><br><i class="glyphicon glyphicon-plus"></i><br><br>Add</a></div>'
   ?         '<div class="col-xs-4 text-center" style=width:25%;>' + ;
                '<a href="#" onclick="Go( ' + "'www.fivetechsoft.com/cgi-bin/fivegen?" + cTableName + 'edit:1' + "' );" + ;
                '"><br><i class="glyphicon glyphicon-pencil"></i><br><br>Edit</a></div>'
   ?         '<div class="col-xs-4 text-center" style=width:25%;><a href="#"><br><i class="glyphicon glyphicon-minus"></i><br><br>Delete</a></div>'
   ?         '<div class="col-xs-4 text-center" style=width:25%;><a href="#"><br><i class="glyphicon glyphicon-remove"></i><br><br>Close</a></div>'
   ?      '</div>'
   ?    '</div>'
   ? '</div>'

return nil

//----------------------------------------------------------------------------//