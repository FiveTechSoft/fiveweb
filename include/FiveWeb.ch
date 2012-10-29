// FiveWeb header file

#ifndef _FIVEWEB_CH
#define _FIVEWEB_CH

#include "hbclass.ch"

#define FWCOPYRIGHT  "(c) FiveTech Software, 1993-2012"

#xcommand ? <x> => ConOut( <x> )

#xcommand SET THEME TO <cTheme> => SetTheme( <cTheme> )

#xcommand DEFINE DIALOG <oDlg> ;
             [ TITLE <cTitle> ] ; 
             [ SIZE <nWidth>, <nHeight> ] ;
       => ;
          <oDlg> := TDialog():New( <cTitle>, <nWidth>, <nHeight> )
          
#xcommand ACTIVATE DIALOG <oDlg> ;
       => ;
          <oDlg>:Activate()               

#endif
