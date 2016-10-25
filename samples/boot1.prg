// Using FiveWeb with Bootstrap

#include "FiveWeb.ch"

function Main()

   UseBootstrap()

   // ? '<div class="container">'

   BSMenu()

   ? '<h2>FiveWeb and Bootstrap example</h2>'
   ? '<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">BSMsgInfo()</button>'

   BSMsgInfo( "Hello world" )

   // ? '</div>'

return nil

function BSMsgInfo( cMsg )

  ? '<div class="modal fade" id="myModal" role="dialog">'
  ? '   <div class="modal-dialog">'
  ? '      <div class="modal-content">'
  ? '         <div class="modal-header">'
  ? '            <button type="button" class="close" data-dismiss="modal">&times;</button>'
  ? '            <h4 class="modal-title">Information</h4>'
  ? '         </div>'
  ? '         <div class="modal-body">'
  ? '            <p>' + cMsg + '</p>'
  ? '         </div>'
  ? '         <div class="modal-footer">'
  ? '            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'
  ? '         </div>'
  ? '      </div>'
  ? '   </div>'
  ? '</div>'

return nil

function BSMenu()

   ? '<nav class="navbar navbar-inverse">'
   ?    '<div class="container-fluid">'
   ?       '<div class="navbar-header">'
   ?           '<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">'
   ?              '<span class="icon-bar"></span>'
   ?              '<span class="icon-bar"></span>'
   ?              '<span class="icon-bar"></span>'
   ?           '</button>'
   ?           '<a class="navbar-brand" href="#">FiveWeb</a>'
   ?        '</div>'
   ?        '<div class="collapse navbar-collapse" id="myNavbar">'
   ?           '<ul class="nav navbar-nav">'
   ?              '<li class="active"><a href="#">Home</a></li>'
   ?              '<li class="dropdown">'
   ?              '   <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>'
   ?              '   <ul class="dropdown-menu">'
   ?              '      <li><a href="#">Page 1-1</a></li>'
   ?              '      <li><a href="#">Page 1-2</a></li>'
   ?              '      <li><a href="#">Page 1-3</a></li>'
   ?              '   </ul>'
   ?              '</li>'
   ?              '<li><a href="#">Page 2</a></li>'
   ?              '<li><a href="#">Page 3</a></li>'
   ?           '</ul>'
   ?           '<ul class="nav navbar-nav navbar-right">'
   ?              '<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>'
   ?              '<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>'
   ?           '</ul>'
   ?        '</div>'
   ?     '</div>'
   ? '</nav>'

return nil