/*
ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
º       BIBLIOTECA DE FUNCOES PARA DESENVOLVIMENTO DE APLICATIVOS       º 
º            COPYRIGHT (C) SILVIO D. - LINGUAGEM CLIPPER 5.0            º
º                   SUBSISTEMA DE TRATAMENTO DE ERROS                   º 
º                                                                       º
º                                                                       º
º INICIO DA FABRICACAO..: 17/03/94  -  TERMINO DA FABRICAO..:           º
º MODULO..: ERRORSYS.PRG            -  FUNCAO..: ERROTXT()              º
º                                                                       º
º                                                                       º  
º OBJETIVO..: Substituir o sistema de controle de erros padrao          º
ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*/                                                                         

***********************************
FUNCTION ERRORSYS()
***********************************

ERRORBLOCK({|ERROR| ERROTXT(ERROR)})


*****************************
FUNCTION ERROTXT(ERRO)
*****************************

LOCAL ARQ,ARQTXT:="ERRO.TXT",MATRIZ:={},;
TELA:=SAVESCREEN(0,0,MAXROW(),MAXCOL()),;
I,START:=1,INTERV:=160,ENTCAR,SAICAR,J, ;
TELA1,LIN,COL,COLOR,CURSOR
SET DEVICE TO SCREEN
IF ERRO:GENCODE()==25
   SOM()       
   COLOR:=SETCOLOR()
   CURSOR:=SETCURSOR()
   LIN:=MAXROW()/2
   COL:=MAXCOL()/2
   TELA1:=SAVESCREEN(LIN-4,COL-17,LIN+6,COL+19)
   RETCOLOR(LIN-4,COL-17,LIN-2,COL+17,CAIXA7,COLOR3)
   RETCOLOR(LIN-2,COL-17,LIN+5,COL+17,CAIXA8,COLOR3)
   SOMBRA(LIN-4,COL-17,LIN+5,COL+17,2)
   @ 09,26 SAY " ### ERRO NA IMPRESSAO ### " COLOR(COLOR3)
   @ 12,26 SAY "VERIFIQUE SE SUA IMPRESSORA" COLOR(COLOR3)
   @ 13,25 SAY "ESTA DESLIGADA OU COM DEFEITO." COLOR(COLOR3)
   OP:=0
   SETCOLOR(COLOR3)
   @ 15,28 PROMPT" RETRY "
   @ 15,45 PROMPT" QUIT  "
   MENU TO OP
   IF OP=0
      SET DEVICE TO PRINT              
      SETCOLOR(COLOR)     
      SETCURSOR(CURSOR)
      RESTSCREEN(LIN-4,COL-17,LIN+6,COL+19,TELA1)
      RETURN(.T.)           
   ELSEIF OP=1
      SET DEVICE TO PRINT              
      SETCOLOR(COLOR)     
      SETCURSOR(CURSOR)
      RESTSCREEN(LIN-4,COL-17,LIN+6,COL+19,TELA1)
      RETURN(.T.)           
   ELSEIF OP=2
      SAIDA1()
      ERRORLEVEL(1)
      QUIT
   ENDIF
ELSE
   AADD(MATRIZ,"                 A T E N C A O                   ")  
   AADD(MATRIZ,"    OCORREU ERRO DURANTE A EXECUCAO DO SISTEMA   ")
   AADD(MATRIZ,"AS IMFORMACOES SERAO GRAVADAS NO ARQUIVO ERRO.TXT")
   AADD(MATRIZ," ")
   AADD(MATRIZ,"         DIGITE UMA TECLA PARA CONTINUAR         ")
   MENSAGEM(MATRIZ,COLOR3,CAIXA6,0)
   ARQ:=FCREATE(ARQTXT,0);FSEEK(ARQ,0,2)
   IF FERROR()<>0
      MENSAGEM("NAO FOI POSSIVEL CRIAR O ARQUIVO ERRO.TXT",COLO3,CAIXA6,4)
   ELSE
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,PADC(" ####   INFORMACOES GERAIS   ####",80)               )
      GRAVA(ARQ,REPLI("-",79)                                              )
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,"  O Erro ocorreu em   : "+PROCNAME(2)                     )
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,"            Data    : "+VALOR(DATE())                     )
      GRAVA(ARQ,"            Hora    : "+TIME() +"h"                       )
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,"  Memoria disponivel  : "+VALOR(MEMORY(0)) + "Kbytes"     )
      GRAVA(ARQ," "                                                        ) 

      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,PADC(" #### INFORMACOES SOBRE O ERRO ####",80)             )
      GRAVA(ARQ,PADC("--------------------------",80)                      )
      GRAVA(ARQ," "                                                        ) 
      GRAVA(ARQ,"  Chamada de subsistema : " +ERRO:SUBSYSTEM()             )
      GRAVA(ARQ,"  Codigo do sistema     : "+VALOR(ERRO:SUBCODE())         )
      GRAVA(ARQ,"  Status do default     : "+ VALOR(ERRO:CANDEFAULT)       )
      GRAVA(ARQ,"  Descricao do erro     : "+ERRO:DESCRIPTION()            )
      GRAVA(ARQ,"  Operacao              : "+ERRO:OPERATION()              )
      GRAVA(ARQ,"  Arquivo envolvido     : "+ERRO:FILENAME()               )
      GRAVA(ARQ,"  Codigo do clipper     : "+VALOR(ERRO:GENCODE())         )
      GRAVA(ARQ,"  Codigo do erro do DOS : "+VALOR(ERRO:OSCODE())          )
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,"  Procurar em : "+ PADR(PROCNAME(2),20)+" na linha "+ PADL(PROCLINE(2),4))
      I:=2
      DO WHILE !EMPTY(PROCNAME(++I))
         FWRITE(ARQ,"  Chamada por : ")
         GRAVA(ARQ, PADR(PROCNAME(I),20)+" na linha "+ PADL(PROCLINE(I),4))
      ENDDO
      GRAVA(ARQ," "                                                         )
      GRAVA(ARQ," "                                                         )
      GRAVA(ARQ,PADC(" #### DUMP DA TELA ONDE OCORREU O ERRO ####",80)      )
      GRAVA(ARQ,PADC("----------------------------------",80)               )
      FOR I:=0 TO 24
          SAICAR:=""
          ENTCAR:=SUBSTR(TELA,START,INTERV)    
          FOR J:=1 TO INTERV STEP 2   
              SAICAR+=SUBSTR(ENTCAR,J,1)
          NEXT
          GRAVA(ARQ,SAICAR)
          START+=INTERV
      NEXT
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,REPLI("-",79)                                              ) 
      GRAVA(ARQ," "                                                        )
      GRAVA(ARQ,PADC(" #### FIM DO ARQUIVO ERRO.TXT #### ",80)             )
      FCLOSE(ARQ)   
      SETCOLOR("W/N,N/W,N/N,N/N,N/W");SAIDA1();SETCURSOR(0)
      @ 00,00 SAY PADC(" ### SISTEMA DE TRATAMENTO DE ERROS - ARQUIVO ERRO.TXT ### ",80) COLOR "N/G+"
      @ 01,00 SAY REPLI("Ä",80)
      @ 23,00 SAY REPLI("Ä",80)
      @ 24,00 SAY PADC(" TECLE ³ESC³ PARA FINALIZAR ",80) COLOR"N/G+"
      MEMOEDIT(MEMOREAD(ARQTXT),02,00,22,80,.F.,,200)
   ENDIF
ENDIF
ERRORLEVEL(1)
SETCURSOR(1)
CLEAR
QUIT

//------------------------------- FUNCOES AUXILIARES ---------------------------


************************************
FUNCTION GRAVA(FILE,INF)
************************************

FWRITE(FILE,INF +CHR(13)+CHR(10))
RETURN(NIL)

************************************
FUNCTION VALOR(VAR)
************************************
LOCAL RETVAL
IF VALTYPE(VAR)="L"  
   RETVAL:=IF(VAR=.T.,"TRUE","FALSE")
ELSEIF VALTYPE(VAR)="N"
   RETVAL:=LTRIM(STR(VAR))
ELSEIF VALTYPE(VAR)="D"
   RETVAL:=DTOC(VAR)
ENDIF
RETURN(RETVAL) 