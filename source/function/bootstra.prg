#include "FiveWeb.ch"

function UseBootstrap()

   ? '<meta charset="utf-8">'
   ? '<meta name="viewport" content="width=device-width, initial-scale=1">'
   ? '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">'
   ? '<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>'

   ? '<div class="container">'

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