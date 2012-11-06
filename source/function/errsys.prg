// Error handler system adapted to FiveWeb

#include "FiveWeb.ch"
#include "common.ch"
#include "error.ch"

#define CRLF HB_OsNewLine()
#define NTRIM(n)    ( LTrim( Str( n ) ) )

#define DLG_TITLE "FiveWeb for Harbour"

static aInitInfo

procedure ErrorSys

   ErrorBlock( { | oError | ErrorDialog( oError ) } )

return

procedure ErrorLink

return

static function ErrorDialog( oError )

   local cErrorLog := "", cMessage, n := 2, j, nButtons := 1
   local oDlg, oLbx, aStack := {}, oOldError, lRet, aRDDs

   // By default, division by zero results in zero
   if oError:genCode == EG_ZERODIV
      return 0
   endif

   // Set NetErr() of there was a database open error
   if oError:genCode == EG_OPEN .and. ;
      oError:osCode == 32 .and. ;
      oError:canDefault
      NetErr( .t. )
      return .f.
   endif

   // Set NetErr() if there was a lock error on dbAppend()
   if oError:genCode == EG_APPENDLOCK .and. oError:canDefault
      NetErr( .t. )
      return .f.
   endif

   if ProcName( 7 ) == "ERRORDIALOG"   // recursive error !!!
      ErrorLevel( 1 )
      QUIT
   endif

   cErrorLog += "Application" + CRLF
   cErrorLog += "===========" + CRLF
   cErrorLog += "   Path and name: " + HB_ArgV( 0 ) + " (32 bits)" + HB_OsNewLine()
   // + GetModuleFileName( GetInstance() )

   cErrorLog += "   Time from start: " + TimeFromStart() + CRLF

   cErrorLog += "   Error occurred at: " + ;
                DToC( Date() ) + ", " + Time() + CRLF

   // Error object analysis
   cMessage   = "Error description: " + ErrorMessage( oError ) + CRLF
   cErrorLog += "   " + cMessage

   if ValType( oError:Args ) == "A"
      cErrorLog += "   Args:" + CRLF
      for n = 1 to Len( oError:Args )
         cErrorLog += "     [" + Str( n, 4 ) + "] = " + ;
	 ValType( oError:Args[ n ] ) + "   " + ;
	 cValToChar( oError:Args[ n ] ) + CRLF
      next
   endif

   cErrorLog += CRLF + "Stack Calls" + CRLF
   cErrorLog += "===========" + CRLF
      n = 2
      while ( n < 74 )
          if ! Empty( ProcName( n ) )
             AAdd( aStack, "   Called from " + Trim( ProcName( n ) ) + ;
                           "(" + NTRIM( ProcLine( n ) ) + ")" )
             cErrorLog += ATail( aStack ) + CRLF
          endif
          n++
    end

   cErrorLog += CRLF + "Variables in use" + CRLF + "================" + CRLF
   cErrorLog += "   Procedure     Type   Value" + CRLF
   cErrorLog += "   ==========================" + CRLF

   n = 2
   while ( n < 74 )
      if ! Empty( ProcName( n ) )
         cErrorLog += "   " + Trim( ProcName( n ) ) + CRLF
         for j = 1 to ParamCount( n )
            cErrorLog += "     Param " + Str( j, 3 ) + ":    " + ;
                         ValType( GetParam( n, j ) ) + ;
                         "    " + cGetInfo( GetParam( n, j ) ) + CRLF
         next
         for j = 1 to LocalCount( n )
            cErrorLog += "     Local " + Str( j, 3 ) + ":    " + ;
                         ValType( GetLocal( n, j ) ) + ;
                         "    " + cGetInfo( GetLocal( n, j ) ) + CRLF
         next
      endif
      n++
   end

   cErrorLog += CRLF + "Linked RDDs" + CRLF + "===========" + CRLF
   aRDDs = RddList( 1 )
   for n = 1 to Len( aRDDs )
      cErrorLog += "   " + aRDDs[ n ] + CRLF
   next

   cErrorLog += CRLF + "DataBases in use" + CRLF + "================" + CRLF
   for n = 1 to 255
      if ! Empty( Alias( n ) )
         cErrorLog += CRLF + Str( n, 3 ) + ": " + If( Select() == n,"=> ", "   " ) + ;
                      PadR( Alias( n ), 15 ) + Space( 20 ) + "RddName: " + ;
                      ( Alias( n ) )->( RddName() ) + CRLF
         cErrorLog += "     ==============================" + CRLF
         cErrorLog += "     RecNo    RecCount    BOF   EOF" + CRLF
         cErrorLog += "    " + Transform( ( Alias( n ) )->( RecNo() ), "99999" ) + ;
                      "      " + Transform( ( Alias( n ) )->( RecCount() ), "99999" ) + ;
                      "      " + cValToChar( ( Alias( n ) )->( BoF() ) ) + ;
                      "   " + cValToChar( ( Alias( n ) )->( EoF() ) ) + CRLF + CRLF
         cErrorLog += "     Indexes in use " + Space( 23 ) + "TagName" + CRLF
         for j = 1 to 15
            if ! Empty( ( Alias( n ) )->( IndexKey( j ) ) )
               cErrorLog += Space( 8 ) + ;
                            If( ( Alias( n ) )->( IndexOrd() ) == j, "=> ", "   " ) + ;
                            PadR( ( Alias( n ) )->( IndexKey( j ) ), 35 ) + ;
                            ( Alias( n ) )->( OrdName( j ) ) + ;
                            CRLF
            endif
         next
         cErrorLog += CRLF + "     Relations in use" + CRLF
         for j = 1 to 8
            if ! Empty( ( nTarget := ( Alias( n ) )->( DbRSelect( j ) ) ) )
               cErrorLog += Space( 8 ) + Str( j ) + ": " + ;
                            "TO " + ( Alias( n ) )->( DbRelation( j ) ) + ;
                            " INTO " + Alias( nTarget ) + CRLF
               // uValue = ( Alias( n ) )->( DbRelation( j ) )
               // cErrorLog += cValToChar( &( uValue ) ) + CRLF
            endif
         next
      endif
   next

   n = 1
   cErrorLog += CRLF + "Classes in use:" + CRLF
   cErrorLog += "===============" + CRLF
   while ! Empty( __ClassName( n ) )
      cErrorLog += "   " + Str( n, 3 ) + " " + __ClassName( n++ ) + CRLF
   end

   cErrorLog += CRLF + "Memory Analysis" + CRLF
   cErrorLog +=        "===============" + CRLF
   cErrorLog += "      " + LTrim( Str( nStatics() ) ) + " Static variables" + ;
                CRLF + CRLF
   cErrorLog += "   Dynamic memory consume:" + CRLF
   cErrorLog += "      Actual  Value: " + Str( MemUsed() ) + " bytes" + CRLF
   cErrorLog += "      Highest Value: " + Str( MemMax() ) + " bytes" + CRLF

   BEGIN SEQUENCE
      oOldError = ErrorBlock( { || DoBreak() } )
      MemoWrit( "error.log", cErrorLog )
   END SEQUENCE
   ErrorBlock( oOldError )

   if oError:canRetry
      nButtons++
   endif

   if oError:canDefault
      nButtons++
   endif

   ? "FiveWeb error<br><br>" 
   for n = 1 to MLCount( cErrorLog )
      ? MemoLine( cErrorLog,, n ) + "<br>"
   next   

   QUIT

return .F.

static func ErrorMessage( e )

    // start error message
    local cMessage := if( empty( e:OsCode ), ;
                      if( e:severity > ES_WARNING, "Error ", "Warning " ),;
                          "(DOS Error " + NTRIM(e:osCode) + ") " )

    // add subsystem name if available
    cMessage += if( ValType( e:SubSystem ) == "C",;
                    e:SubSystem()                ,;
                    "???" )

    // add subsystem's error code if available
    cMessage += if( ValType( e:SubCode ) == "N",;
                    "/" + NTRIM( e:SubCode )   ,;
                    "/???" )

    // add error description if available
    if ( ValType( e:Description ) == "C" )
        cMessage += CRLF + "   " + e:Description
    end

    // add either filename or operation
    cMessage += if( ! Empty( e:FileName ),;
                    ": " + e:FileName   ,;
                    if( !Empty( e:Operation ),;
                        ": " + e:Operation   ,;
                        "" ) )
return cMessage

static function DoBreak()

   BREAK

return nil

static function cGetInfo( uVal )

   local cType := ValType( uVal )

   do case
      case cType == "C"
           return '"' + cValToChar( uVal ) + '"'

      case cType == "O"
           return "Class: " + uVal:ClassName()

      case cType == "A"
           return "Len: " + Str( Len( uVal ), 4 )

      otherwise
           return cValToChar( uVal )
   endcase

return nil

init procedure InitTime()

   aInitInfo = { Date(), Seconds() }

return

function TimeFromStart()

   local nSeconds := SecsFromStart( aInitInfo[ 1 ], aInitInfo[ 2 ] )
   local nHours := Int( nSeconds / 3600 )
   local nMins  := Int( ( nSeconds - ( nHours * 3600 ) ) / 60 )
   local nSecs  := Int( nSeconds - ( nHours * 3600 ) - ( nMins * 60 ) )

return AllTrim( Str( nHours ) ) + " hours " + ;
       AllTrim( Str( nMins ) ) + " mins " + ;
       AllTrim( Str( nSecs ) ) + " secs "

static function SecsFromStart( dInitDate, nInitSecs )

   local nSeconds:= Seconds()
   local nDays := Date() - dInitDate

   if nDays < 0  // Surely you change the date after the beginning of the system
      return 0
   endif

   if nDays > 0
      nDays--
      return ( 86399 - nInitSecs ) + ( nDays * 86399 ) + nSeconds
   endif

return nSeconds - nInitSecs
