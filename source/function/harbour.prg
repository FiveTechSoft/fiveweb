#include "error.ch"
#include "fwerror.ch"

#define CRLF Chr( 13 ) + Chr( 10 )

#ifdef __HARBOUR__
   #ifndef __XHARBOUR__
   #ifndef __FWCE__
      function HB_DBG_VMSTKLCOUNT( x ) ;  return __DBGVMSTKLCOUNT( x )
      function HB_DBG_VMPARLLIST( x ) ;   return __DBGVMPARLLIST( x )
      function HB_DBG_VMVARLGET( x, y ) ; return __DBGVMVARLGET( x, y )
      function HB_DBG_VMVARSLEN() ;       return __DBGVMVARSLEN()
   #endif
   #endif
#endif      

//----------------------------------------------------------------------------//

function LocalCount( nProcLevel )

return HB_DBG_VMSTKLCOUNT( nProcLevel + 1 ) - ParamCount( nProcLevel + 1 )

//----------------------------------------------------------------------------//

function ParamCount( nProcLevel )

return Len( HB_DBG_VMPARLLIST( nProcLevel + 1 ) )

//----------------------------------------------------------------------------//

function GetParam( nProcLevel, nParam )

return HB_DBG_VMPARLLIST( nProcLevel + 1 )[ nParam ]

//----------------------------------------------------------------------------//

function MemUsed()

return Memory( 1001 )

//----------------------------------------------------------------------------//

function MemMax()

return Memory( 1002 )

//----------------------------------------------------------------------------//

function NtxPos()

return 0

//----------------------------------------------------------------------------//

function uLoadObject() // dummy function waiting to become ready
return nil

//----------------------------------------------------------------------------//

function VbxEvent()
return nil

//----------------------------------------------------------------------------//

function LoadVbx()
return nil

//----------------------------------------------------------------------------//

function VbxClassName()
return ""

//----------------------------------------------------------------------------//

function TVbControl()
return nil

//----------------------------------------------------------------------------//

function WindowsFix()  // no needed for Harbour
return nil

//----------------------------------------------------------------------------//

function ChildLevel( o, oClass )

return If( o:IsDerivedFrom( oClass ) .or. ;
           Upper( o:ClassName() ) == Upper( oClass:ClassName() ), 1, 0 )

//----------------------------------------------------------------------------//

function OClone( o )

return __objClone( o )

//----------------------------------------------------------------------------//

function SetMultiple( lOnOff )

return nil

//----------------------------------------------------------------------------//

function GetLocal( nProcLevel, nLocal )

return HB_DBG_VMVARLGET( nProcLevel + 1, ParamCount( nProcLevel + 1 ) + nLocal )

//----------------------------------------------------------------------------//

function NInitDSSize()

return 0

//----------------------------------------------------------------------------//

function NSYMPSIZE()

return 0

//----------------------------------------------------------------------------//

function nStackSize()

return 0

//----------------------------------------------------------------------------//

function nHeapSize()

return 0

//----------------------------------------------------------------------------//

function nStatics()

return HB_DBG_VMVARSLEN()

//----------------------------------------------------------------------------//

function _GenError( nError, cClassName, cMsg )

   local oError := ErrorNew()

   oError:SubSystem   = "BASE"
   oError:SubCode     = nError
   oError:Severity    = ES_ERROR
   oError:Description = "Message not found"
   oError:Operation   = cClassName + ":" + cMsg

return oError

//----------------------------------------------------------------------------//

function _CLSSETERROR( oError )

return Eval( ErrorBlock(), oError )

//----------------------------------------------------------------------------//

#ifndef __XHARBOUR__

/*
function Execute( cCode, ... )
 
   local oHrb, cResult, bOldError, uRet
   local cFWheaders := If( lIsDir( "./include" ), "./include", "../include" )
   local cHBheaders := If( lIsDir( "./include" ), "./include", "../../harbour/include" )
 
   // FReOpen_Stderr ( "comp.log", "w" )
   oHrb = HB_CompileFromBuf( cCode, "-n", "-I" + cFWheaders, "-I" + cHBheaders )
   if ! Empty( oHrb )
      BEGIN SEQUENCE
      bOldError = ErrorBlock( { | o | DoBreak( o ) } )
      uRet = hb_HrbDo( hb_HrbLoad( oHrb ), ... )
      END SEQUENCE
      ErrorBlock( bOldError )
   endif

return uRet
*/

//----------------------------------------------------------------------------//
 
static function DoBreak( oError )
 
   local cInfo := oError:operation, n
 
   if ValType( oError:Args ) == "A"
      cInfo += "   Args:" + CRLF
      for n = 1 to Len( oError:Args )
         MsgInfo( oError:Args[ n ] )
         cInfo += "[" + Str( n, 4 ) + "] = " + ValType( oError:Args[ n ] ) + ;
                   "   " + cValToChar( oError:Args[ n ] ) + CRLF
      next
   endif
 
   MsgInfo( oError:Description + CRLF + cInfo,;
            "Script error at line: " + AllTrim( Str( ProcLine( 2 ) ) ) )
 
   BREAK
 
return nil
 
//----------------------------------------------------------------//

function ASend( aObjects, cMsg, ... )

   local n

   if aObjects == nil
      return nil
   endif
   
   for n = 1 to Len( aObjects )
      OSend( aObjects[ n ], cMsg, ... )
   next

   return nil

#else   

function ASend( ... ) //aObjects, cMsg, uPar1,...

   local aParams := hb_aParams()
   local aObjects, n, j
   local aParams2 := {}

   if aParams[ 1 ] == nil
      return nil
   endif
   aObjects = aParams[ 1 ] 
   
   for n = 1 to Len( aObjects )
     AAdd( aParams2, aObjects[ n ] )
     for j = 2 to Len( aParams ) 
        AAdd( aParams2, aParams[ j ] )
     next j
     hb_execFromArray( @OSend(),  aParams2 )
     aParams2 = {}
   next
   return nil
#endif 

//----------------------------------------------------------------------------//

#ifndef __XHARBOUR__
function OSend( oObj, cMsg, ... )
   if "(" $ cMsg
      cMsg = StrTran( cMsg, "()", "" )
   endif
   return __ObjSendMsg( oObj, cMsg, ... )
#else   
function OSend( ... ) // oObj, cMsg, uPar1,...
   local aParams := hb_aParams()
      
   if "(" $ aParams[ 2 ]
      aParams[ 2 ] = StrTran( aParams[ 2 ], "()", "" )
   endif

   return hb_execFromArray( @__ObjSendMsg(), aParams )   
#endif 

//----------------------------------------------------------------------------//

#ifdef __XHARBOUR__

// Keep this C code here so only xHarbour uses it

#pragma BEGINDUMP

//char * hb_parc( int iParam, ... );
//ULONG  hb_parclen( int iParam, ... );
//int    hb_parni( int iParam, ... );
//LONG   hb_parnl( int iParam, ... );
//int    hb_parl( int iParam, ... );
//void   hb_storc( const char * szText, int iParam, ... );
//void   hb_storclen( const char * szText, ULONG ulLength, int iParam, ... );
//void   hb_storl( int iLogical, int iParam, ... );
//void   hb_storni( int iValue, int iParam, ... );
//void   hb_stornl( LONG lValue, int iParam, ... ); 
//void   hb_stords( const char * szDate, int iParam, ... );
//void   hb_stornd( double dValue, int iParam, ... );

char * hb_parvc( int iParam, int iIndex )
{
   return ( char * ) hb_parc( iParam, iIndex );
}   

ULONG hb_parvclen( int iParam, int iIndex )
{
   return hb_parclen( iParam, iIndex );
} 

int hb_parvni( int iParam, int iIndex )
{
   return hb_parni( iParam, iIndex );
}  

long hb_parvnl( int iParam, int iIndex )
{
   return hb_parnl( iParam, iIndex );
}  

BOOL hb_parvl( int iParam, int iIndex )
{
   return hb_parl( iParam, iIndex );
}  

void hb_storvc( char * szText, int iParam, int iIndex )
{
   hb_storc( szText, iParam, iIndex );
}   

void hb_storvclen( char * szText, ULONG ulLength, int iParam )
{
   hb_storclen( szText, ulLength, iParam );
}   

void hb_storvl( BOOL bValue, int iParam, int iIndex )
{
   hb_storl( bValue, iParam, iIndex );
}   

void hb_storvnl( LONG lValue, int iParam, int iIndex )
{
   hb_stornl( lValue, iParam, iIndex );
}  

void hb_storvni( int iValue, int iParam, int iIndex )
{
   hb_storni( iValue, iParam, iIndex );
} 

void hb_storvds( char * szDate, int iParam, int iIndex )
{
   hb_stords( szDate, iParam, iIndex );
}     

void hb_storvnd( double dValue, int iParam, int iIndex )
{
   hb_stornd( dValue, iParam, iIndex );
}     

#pragma ENDDUMP

#endif

//----------------------------------------------------------------------------//
