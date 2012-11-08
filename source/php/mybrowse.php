<?php

   $link = mysql_connect( "mysql.fivetechsoft.net", "", "" )
           or die( "Can't connect: " . mysql_error() );

   mysql_select_db( "fiveweb" ) or die( "Can't select the database" );

   $query  = "SELECT * FROM ".$_GET[ "name" ]." LIMIT 0, 100";
   $result = mysql_query( $query ) or die( "Query failed: " . mysql_error() );

   echo "<html><head>\n";
   echo '<link type="text/css" rel="stylesheet" href="../fiveweb/bootstrap.css">';
   echo "</head><body>\n";

   if( mysql_num_rows( $result ) == 0 )
   {
      echo "no results";
   }
   else
   {   
      echo "<table class='table table-hover' id='browse' style='background-color: #CCC;'>\n";

      echo "<thead>"."<tr>";
      echo "<th></th>";
      for( $i = 0; $i < mysql_num_fields( $result ); $i++ )
         echo "<th>".mysql_field_name( $result, $i )."</th>";
      echo "</tr>";  
      echo "</thead>"; 

      $nRow = 0;

      while ( $line = mysql_fetch_array( $result, MYSQL_ASSOC ) ) 
      {
      	 echo "<tr>";

         echo "<td width=10px;>"."<input type='checkbox' name='".strval( $nRow )."' onclick=".'"'."toggleRowSelected( this )".'"'."</td>";
         // echo "<td width=10px;>"."<input type='checkbox' name='".$line[ "id" ]."' onclick=".'"'."toggleRowSelected( this )".'"'."</td>";

         foreach( $line as $value_col ) 
         {
      	    echo "<td>"."$value_col"."</td>";
         }
         echo "</tr>\n";
      }

      echo "</table>\n";
   }

   echo "</body>\n";

   mysql_free_result( $result );
   mysql_close( $link );
?> 
