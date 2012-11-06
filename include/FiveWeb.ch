// FiveWeb header file

#ifndef _FIVEWEB_CH
#define _FIVEWEB_CH

#include "hbclass.ch"

#define FWCOPYRIGHT  "(c) FiveTech Software, 1993-2012"

extern ErrorSys  // FiveWeb error system

#xcommand DEFAULT <uVar1> := <uVal1> ;
               [, <uVarN> := <uValN> ] => ;
                  If( <uVar1> == nil, <uVar1> := <uVal1>, ) ;;
                [ If( <uVarN> == nil, <uVarN> := <uValN>, ); ]

#xcommand ? <x> => ConOut( <x> )

#xcommand SET THEME TO <cTheme> => SetTheme( <cTheme> )

#xcommand DEFINE DIALOG <oDlg> ;
             [ TITLE <cTitle> ] ; 
             [ SIZE <nWidth>, <nHeight> ] ;
       => ;
          <oDlg> := TDialog():New( <cTitle>, <nWidth>, <nHeight> )
          
#xcommand ACTIVATE DIALOG <oDlg> ;
             [ <modal: NOWAIT, NOMODAL> ] ;
       => ;
          <oDlg>:Activate( ! <.modal.> )               

#xcommand @ <nRow>, <nCol> BUTTON [ <oBtn> PROMPT ] <cPrompt> ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ OF <oDlg> ] ;
       => ;
          TButton():New( <nRow>, <nCol>, <cPrompt>, <nWidth>, <nHeight>, <oDlg>, [<(oBtn)>] )

#xcommand @ <nRow>, <nCol> CHECKBOX <lValue> ;
             [ PROMPT <cPrompt> ] ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ OF <oDlg> ] ;
       => ;
          TCheckBox():New( <nRow>, <nCol>, <lValue>, <cPrompt>, <nWidth>, <nHeight>, <oDlg> )


#xcommand @ <nRow>, <nCol> RADIO [ <oRadMenu> ] ;
             [ <prm: PROMPT, ITEMS> <cItems,...> ] ;
             [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
             [ SIZE <nWidth>, <nHeight> ] ;
       => ;
          [ <oRadMenu> := ] TRadMenu():New( <nRow>, <nCol>, {<cItems>},;
             <nWidth>, <nHeight>, <oWnd> , [<(oRadMenu)>] )

#command @ <nRow>, <nCol> DTPICKER [ <oDpick> ]  ;
            [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
            [ SIZE <nWidth>, <nHeight> ] ;
      => ; 
         [ <oDpick> := ] TDatePicker():New( <nRow>, <nCol>,;
            <nWidth>, <nHeight>, <oWnd>, [<(oDpick)>] )
          
#xcommand @ <nRow>, <nCol> FOLDER <oFld> ;          
            [ SIZE <nWidth>, <nHeight> ] ;
            [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
            [ <prm: PROMPTS, ITEMS> <cPrompts,...> ] ;
      => ; 
         [ <oFld> := ] TFolder():New( <nRow>, <nCol>, {<cPrompts>},;
            <nWidth>, <nHeight>, <oWnd>, [<(oFld)>] )                       
#endif
