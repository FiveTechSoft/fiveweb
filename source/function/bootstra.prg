#include "FiveWeb.ch"

function UseBootstrap()

   ? '<meta charset="utf-8">'
   ? '<meta name="viewport" content="width=device-width, initial-scale=1">'
   ? '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">'
   ? '<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>'
   ? '<script src="https://bitbucket.org/fivetech/fiveweb/downloads/fiveweb.js"></script>'

   ? '<div class="container">'

return nil

function EditQuery( oQuery, cTableName )

   local aValues := oQuery:FillArray() 
   local aHeaders := {}
   
   for n = 1 to Len( aValues[ 1 ] )
      AAdd( aHeaders, oQuery:FieldName( n ) )
   next   

   Edit( "Edit " + cTableName, aHeaders, aValues )
   
return nil

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
         case ValType( aValues[ Min( n, Len( aValues ) ) ] ) == "A"
            ? '<select id="' + aLabels[ n ] + '" class="form-control">'
            for m = 1 to Len( aValues[ n ] ) 
               ? '<option>' + cValToChar( aValues[ n ][ m ] ) + '</option>'
            next   
            ? '</select>'
         
         case ValType( aValues[ Min( n, Len( aValues ) ) ] ) == "L"
            ? '<select id="' + aLabels[ n ] + '" class="form-control">'
            ? '<option' + If( aValues[ n ], " selected", "" ) + '>Yes</option>'
            ? '<option' + If( aValues[ n ], " selected", "" ) + '>No</option>'
            ? '</select>'
         otherwise
            ? '<input class="form-control" id="' + aLabels[ n ] + '" type="text" value="' + cValToChar( aValues[ Min( n, Len( aValues ) ) ] ) + '">'
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

function Footer()

   ? '<div id="footer">'
   ?   '<div class="col-xs-16 navbar-inverse navbar-fixed-bottom">'
   ?      '<div class="row" id="bottomNav">'
   ?         '<div class="col-xs-4 text-center" style=width:25%;><a href="#"><br><i class="glyphicon glyphicon-plus"></i><br><br>Add</a></div>'
   ?         '<div class="col-xs-4 text-center" style=width:25%;><a href="#"><br><i class="glyphicon glyphicon-pencil"></i><br><br>Edit</a></div>'
   ?         '<div class="col-xs-4 text-center" style=width:25%;><a href="#"><br><i class="glyphicon glyphicon-minus"></i><br><br>Delete</a></div>'
   ?         '<div class="col-xs-4 text-center" style=width:25%;><a href="#"><br><i class="glyphicon glyphicon-remove"></i><br><br>Close</a></div>'
   ?      '</div>'
   ?    '</div>'
   ? '</div>'

return nil