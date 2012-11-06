function uValBlank( uValue )

   local cType := ValType( uValue )
   local uResult

   do case
      case cType $ "CM"
       uResult = Space( Len( uValue ) )

      case cType == "N"
       uResult =  uValue - uValue

      case cType == "L"
       uResult = .f.

      case cType == "D"
       uResult = CToD( "  -  -  " )

   endcase

return uResult

function cValToChar( uVal )

   local cType := ValType( uVal )

   if uVal == nil
      return "nil"
   endif

   do case
      case cType == "C" .or. cType == "M"
           return uVal

      case cType == "D"
           return DToC( uVal )

      case cType == "L"
           return If( uVal, ".T.", ".F." )

      case cType == "N"
           return AllTrim( Str( uVal ) )

      case cType == "B"
           return "{|| ... }"

      case cType == "A"
           return "{ ... }"

      case cType == "O"
           return "Object"

      otherwise
           return ""
   endcase

return nil
