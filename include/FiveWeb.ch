// FiveWeb header file

#ifndef _FIVEWEB_CH
#define _FIVEWEB_CH

#include "hbclass.ch"

#define FWCOPYRIGHT  "(c) FiveTech Software, 1993-2013"

extern ErrorSys  // FiveWeb error system

#define CRLF "<br>"

#xcommand SET COLOR TO <cColor> => SetBackColor( <cColor> )

#xcommand SET BACKIMAGE TO <cImage> => SetBackImage( <cImage> )

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
             [ <center: CENTER, CENTERED>	] ; 			 
       => ;
          <oDlg>:Activate( ! <.modal.>, [<.center.>] )               

#xcommand @ <nRow>, <nCol> BUTTON [ <oBtn> PROMPT ] <cPrompt> ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ OF <oDlg> ] ;
             [ ACTION <uAction> ] ;
             [ <resname: RESOURCE, NAME, RESNAME> <cResName> ] ;
       => ;
          [<oBtn> :=] TButton():New( <nRow>, <nCol>, <cPrompt>, <nWidth>, <nHeight>, <oDlg>,;
             [<(oBtn)>], <(uAction)>, <(cResName)> )

// To create Toolbars buttons
#xcommand DEFINE BUTTON [ <oBtn> ] ;
             [ <bar: OF, BUTTONBAR > <oWnd> ] ;
             [ <resource: NAME, RESNAME, RESOURCE> <cResName> ] ;
             [ ACTION <uAction> ] ;
       => ;
          [<oBtn> :=] TButton():Define( <oWnd>, <(uAction)>, <(cResName)>, [<(oBtn)>] )
             
#xcommand @ <nRow>, <nCol> PROGRESS [ <oPrg> VAR ] <nValue> ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ OF <oDlg> ] ;
       => ;
          [ <oPrg> := ] TProgress():New( <nRow>, <nCol>, <nWidth>, <nHeight>, <oDlg>, [<(oPrg)>],;
             <nValue> )

#xcommand @ <nRow>, <nCol> SAY [ <oSay> <label: PROMPT,VAR > ] <cText> ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ TITLE <cTitle> ] ;
             [ URL <cUrl> ] ;
             [ OF <oDlg> ] ;
       => ;
          [ <oSay> := ] TSay():New( <nRow>, <nCol>, <cText>, <nWidth>, <nHeight>, <oDlg>, [<(oSay)>],[<cUrl>],[<cTitle>] )

#xcommand @ <nRow>, <nCol> GET [ <oGet> VAR ] <uValue> ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ OF <oDlg> ] ;
             [ <lHide: HIDE > ] ;
             [ <lPassword: PASSWORD> ] ;
             [ PICTURE <cPict> ] ;
		       [ <lMultiline: MEMO, TEXT, MULTILINE> ] ;		 
       => ;
          [ <oGet> := ] TGet():New( <nRow>, <nCol>, <uValue>, <nWidth>, <nHeight>, <oDlg>,;
                                    [<(oGet)>], [<.lHide.>], [<.lPassword.>], [<cPict>], [<.lMultiline.>] )

#xcommand @ <nRow>, <nCol> CHECKBOX [ <oCbx> VAR ] <lValue> ;
             [ PROMPT <cPrompt> ] ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ OF <oDlg> ] ;
             [ <lstyle: BUTTON > ] ;
       => ;
          [ <oCbx> := ] TCheckBox():New( <nRow>, <nCol>, <lValue>, <cPrompt>,;
                        <nWidth>, <nHeight>, <oDlg>, [<.lstyle.>] )

#xcommand @ <nRow>, <nCol> IMAGE [<oImg>] ;
             [ <file: FILENAME, FILE, URL> <cUrl> ] ;
             [ SIZE <nWidth>, <nHeight> ] ;
             [ OF <oDlg> ] ;
       => ;
          [ <oImg> := ] TImage():New( <nRow>, <nCol>, <nWidth>, <nHeight>, <oDlg>,;
                                      [<(oImg)>], [<(cUrl)>] )

#xcommand @ <nRow>, <nCol> RADIO [ <oRadMenu> ] ;
             [ <prm: PROMPT, ITEMS> <cItems,...> ] ;
             [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
             [ SIZE <nWidth>, <nHeight> ] ;
       => ;
          [ <oRadMenu> := ] TRadMenu():New( <nRow>, <nCol>, {<cItems>},;
             <nWidth>, <nHeight>, <oWnd> , [<(oRadMenu)>] )

#xcommand @ <nRow>, <nCol> COMBOBOX [ <oCbx> ] ;
             [ VAR <uVar> ] ;
             [ <prm: PROMPT, ITEMS> <cItems,...> ] ;
             [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
             [ SIZE <nWidth>, <nHeight> ] ;
       => ;
          [ <oCbx> := ] TComboBox():New( <nRow>, <nCol>,;
             <nWidth>, <nHeight>, <oWnd>, {<cItems>}, [<(oCbx)>], [<uVar>] )

#command @ <nRow>, <nCol> DTPICKER [ <oDpick> ]  ;
            [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
            [ SIZE <nWidth>, <nHeight> ] ;
            [ <lInline: INLINE > ] ;
      => ; 
         [ <oDpick> := ] TDatePicker():New( <nRow>, <nCol>,;
            <nWidth>, <nHeight>, <oWnd>, [<(oDpick)>], <.lInline.> )
          
#xcommand @ <nRow>, <nCol> FOLDER <oFld> ;          
            [ SIZE <nWidth>, <nHeight> ] ;
            [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
            [ <prm: PROMPTS, ITEMS> <cPrompts,...> ] ;
      => ; 
         [ <oFld> := ] TFolder():New( <nRow>, <nCol>, {<cPrompts>},;
            <nWidth>, <nHeight>, <oWnd>, [<(oFld)>] )   
            
#xcommand @ <nRow>, <nCol> BROWSE <oBrw> ;          
            [ SIZE <nWidth>, <nHeight> ] ;
            [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
            [ URL <cUrl> ] ;
            [ ARRAY <aValues> ] ;
      => ; 
         [ <oBrw> := ] TBrowse():New( <nRow>, <nCol>,;
            <nWidth>, <nHeight>, <oWnd>, [<(oBrw)>], [<cUrl>], [<aValues>] )   

#xcommand @ <nRow>, <nCol> BROWSE <oBrw> ;          
            [ SIZE <nWidth>, <nHeight> ] ;
            [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
            [ ARRAY <aDatos> ] ;
      => ; 
         [ <oBrw> := ] TBrowse():New( <nRow>, <nCol>,;
            <nWidth>, <nHeight>, <oWnd>, [<(oBrw)>], , [<aDatos>] )

#xcommand MENU [ <oMenu> ] ;
       => ;
          [ <oMenu> := ] MenuBegin( <(oMenu)> )                                
     
#xcommand MENUITEM [ <oMenuItem> PROMPT ] [<cPrompt>] ;
             [ ACTION <uAction,...> ] ;
       => ;
          [ <oMenuItem> := ] MenuAddItem( <cPrompt>, <(uAction)> )
      
#xcommand ENDMENU => MenuEnd()

#xcommand DEFINE TOOLBAR <oTbr> ;
            [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
      => ; 
         <oTbr> := TToolBar():New( <oWnd>, <(oTbr)> )
                                
#endif
