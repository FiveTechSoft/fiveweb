//---------------------------------------------------------------------------//

function cFileNoPath( cPathMask )  // returns just the filename no path

    local n

    cPathMask = StrTran( cPathMask, "/", "\" )
    n = RAt( "\", cPathMask )

return If( n > 0 .and. n < Len( cPathMask ),;
           Right( cPathMask, Len( cPathMask ) - n ),;
           If( ( n := At( ":", cPathMask ) ) > 0,;
           Right( cPathMask, Len( cPathMask ) - n ),;
           cPathMask ) )

//---------------------------------------------------------------------------//

function AppName()

return cFileNoPath( hb_argv( 0 ) )

//---------------------------------------------------------------------------//
