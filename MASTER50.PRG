/*
÷ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ∑
∫ PROGRAMA.............: MASTER.PRG                                   ∫
∫ AUTOR................: SILVIO DANILO DE OLIVEIRA                    ∫ 
∫ INICIO DA FABRICACAO.: 24/01/94                                     ∫
∫ OBJETIVO.............: SERVIR COMO UMA BIBLIOTECA                   ∫
∫ TERMINO DA FABRICACAO: IGNORADO                                     ∫
∫ LINGUAGEM............: CLIPPER 5.0                                  ∫
”ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒΩ
*/

***********************************
FUNCTION INICIO
***********************************

CLOSE ALL
CLEAR
SET WRAP ON
SET DELE ON
SETCANCEL(.F.)
SET DATE BRIT
SET BELL OFF
SET TALK OFF
SET SCOR OFF
SET DELI TO "[]"
SET STAT OFF
SET SAFE OFF
SET MESS TO MAXROW() CENTER
PUBLIC HLP,HORA1,CAIXA1,CAIXA2,CAIXA3,;
CAIXA4,CAIXA5,CAIXA6,CAIXA7,CAIXA8,;
PADRAO,COLOR1,COLOR2,COLOR3,COLOR4,COLOR5,CONF1,;
CONF2,CONF3,CONF4,CONF5,CONF6,CONF7
HLP=0
HORA1:=TIME()
CAIXA1:="⁄ƒø≥Ÿƒ¿≥"
CAIXA2:="√ƒ¥≥Ÿƒ¿≥"
CAIXA3:="…Õª∫ºÕ»∫"
CAIXA4:="…Õª∫πÕÃ∫"
CAIXA5:="ÃÕπ∫ºÕ»∫"
CAIXA6:="÷ƒ∑∫Ωƒ”∫"
CAIXA7:="÷ƒ∑∫∂ƒ«∫"   
CAIXA8:="«ƒ∂∫Ωƒ”∫"
COLOR1:="W+/G+,N/W+,,,W+/G+"
COLOR2:="W+/N,N/G+,,,N/W+"
COLOR3:="N/G+,N/W+,,,W+/G+"
COLOR4:="G+/W+,R+/G+,,,W+/N"
COLOR5:="W+/BG+,W/G+,,,W/G+"
PADRAO:="W/N,N/W,N/N,N/N,N/W"
CONF1:=CHR(30)+[5]
CONF2:=CHR(30)+[4]
CONF3:=CHR(30)+[3]
CONF4:=CHR(30)+[2]
CONF5:=CHR(30)+[1]
CONF6:=CHR(14)
CONF7:=CHR(20)
RETURN(.T.)

*//--------------------------- FIM DA FUNCAO INICIO --------------------

*************************************
FUNCTION TEMPO
*************************************

LOCAL HORA2,TEMPO
HORA2:=TIME()
TEMPO:=ELAPTIME(HORA1,HORA2)
RETURN(TEMPO)

*//--------------------------- FIM DA FUNCAO TEMPO ---------------------
 
*************************************
FUNCTION MENSAGEM(MESS,COR,BOX,SCT)
*************************************

LOCAL CURSOR,COLOR,LIN,COL,LIN1,COL1,T
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
SOM()
MESS:=IF(MESS==NIL,"Faltou a Mensagem...",MESS)
COR:=IF(COR==NIL,COLOR1,COR)
BOX:=IF(BOX==NIL,CAIXA3,BOX)
SCT:=IF(SCT==NIL,2,SCT)
IF VALTYPE(MESS)="C"
   LIN:=(MAXROW()/2)-2
   COL:=(MAXCOL()/2)-LEN(MESS)/2-2
   LIN1:=(MAXROW()/2)+2
   COL1:=(MAXCOL()/2)+LEN(MESS)/2+1  
   SETCOLOR(COR)
   T:=SAVESCREEN(LIN-1,COL-2,LIN1+2,COL1+4)
   SCROLL(LIN-1,COL-2,LIN1+1,COL1+2,0)
   DISPBOX( LIN,COL,LIN1,COL1,BOX)
   SOMBRA(LIN-1,COL-2,LIN1+1,COL1+2)
   @ LIN+2,COL+2 SAY MESS
ELSEIF VALTYPE(MESS)="A"
   LIN:=(MAXROW()/2)-LEN(MESS)/2-1
   COL:=(MAXCOL()/2)-LEN(MESS[1])/2-2
   LIN1:=(MAXROW()/2)+LEN(MESS)/2+2
   COL1:=(MAXCOL()/2)+LEN(MESS[1])/2+1
   SETCOLOR(COR)
   T:=SAVESCREEN(LIN-1,COL-2,LIN1+2,COL1+4)
   SCROLL(LIN-1,COL-2,LIN1+1,COL1+2,0)
   DISPBOX(LIN,COL,LIN1,COL1,BOX)
   SOMBRA(LIN-1,COL-2,LIN1+1,COL1+2,2)   
   FOR X:=1 TO LEN(MESS)
        @ LIN+1+X,COL+2 SAY MESS[X]
   NEXT
ENDIF
SETCURSOR(0)
INKEY(SCT)
SETCOLOR(COLOR)
SETCURSOR(CURSOR) 
RESTSCREEN(LIN-1,COL-2,LIN1+2,COL1+4,T)
RETURN(.T.)

*//-------------------------- FIM DA FUNCAO MENSAGEM -----------------------

**************************************
FUNCTION SOMBRA(LIN,COL,LIN1,COL1,COR)
**************************************

LOCAL LINHA,COLUNA
COR:=IF(COR==NIL,8,COR)
LINHA:=SAVESCREEN(LIN1+1,COL+2,LIN1+1,COL1+2)
COLUNA:=SAVESCREEN(LIN+1,COL1+1,LIN1,COL1+2)
LINHA:=TRANSFORM(LINHA,REPLICATE("X"+CHR(COR),LEN(LINHA)/2))
COLUNA:=TRANSFORM(COLUNA,REPLICATE("X"+CHR(COR),LEN(COLUNA)/2))
RESTSCREEN(LIN1+1,COL+2,LIN1+1,COL1+2,LINHA)  
RESTSCREEN(LIN+1,COL1+1,LIN1,COL1+2,COLUNA)
RETURN(.T.)

*//--------------------------- FIM DA FUNCAO SOMBRA -------------------------

*********************************************
FUNCTION RETCOLOR(LIN,COL,LIN1,COL1,TIPO,COR)
*********************************************

LOCAL COLOR
COLOR:=SETCOLOR()
COR:=IF(COR==NIL,COLOR1,COR)
TIPO:=IF(TIPO==NIL,2,TIPO)
IF VALTYPE(TIPO)="N"
   TIPO:=IF(TIPO<>1 .AND. TIPO<>2,2,TIPO)
ENDIF
SETCOLOR(COR)
SCROLL(LIN,COL,LIN1,COL1,0)
DISPBOX(LIN,COL,LIN1,COL1,TIPO)
SETCOLOR(COLOR)
RETURN(.T.)

*//---------------------------- FIM DA FUNCAO RETCOLOR ---------------------

*************************
FUNCTION PROCURA
*************************

PARAMETERS N,C,C1,VAR,N1,COR,Z
IF N==NIL .OR. VAR==NIL
   RETURN .F.
ELSE
   S:=SELECT()
   SELECT &N
   C:=IF(C==NIL,"FALTOU MENSAGEM",C)
   C1:=IF(C1==NIL,"FALTOU MENSAGEM",C1)
   N1:=IF(N1==NIL,0,N1)
   COR:=IF(COR==NIL,COLOR1,COR)
   SEEK VAR
   IF FOUND()
      IF N1==0
         MENSAGEM(C,COR,1,3)
         SELECT &S 
         RETURN(.F.)  
      ELSE
         Z:=CRIA_VAR(1)
         SELECT &S
         RETURN(.T.)
      ENDIF
   ELSE
      IF N1==0
         SELECT &S
         RETURN(.T.)
      ELSE  
         MENSAGEM(C1,COR,1,3)
         SELECT &S
         RETURN(.F.)
      ENDIF
   ENDIF 
ENDIF
*//-------------------------- FIM DA FUNCAO PROCURA -------------------------

************************************
FUNCTION CRIA_VAR(VAR)
************************************

LOCAL I:=0,B:=FCOUNT(),REGISTRO:=RECNO(),M:={}
IF VAR==NIL 
   GO 0
ENDIF
FOR I:=1 TO B
    AADD(M,FIELDGET(I))
NEXT
GO REGISTRO
RETURN(M)

*//---------------------------- FIM DA FUNCAO CRIA_VAR ----------------------

***************************************
FUNCTION GRAVA_VAR(MAT)
***************************************

LOCAL I:=0,B:=FCOUNT()
FOR I:=1 TO B
    FIELDPUT(I,MAT[I])
NEXT

*//---------------------------- FIM DA FUNCAO GRAVA_VAR ---------------------

**************************************
FUNCTION SAIDA1
**************************************

LOCAL LC,LB,CE,CD
LC:=(MAXROW()/2)-1
LB:=(MAXROW()/2)+1
CE:=(MAXCOL()/2)-1
CD:=(MAXCOL()/2)+1
SETCOLOR("W/N,N/W,N/N,N/N,N/W")
SETCURSOR(0)
DO WHILE LC>0
   SCROLL(LC,CE,LB,CD,0)
   LC:=LC-0.13
   CE:=CE-0.48
   LB:=LB+0.14
   CD:=CD+0.49
ENDDO
SETCURSOR(1)
RETURN(.T.)

*//---------------------------- FIM DA FUNCAO SAIDA1 --------------------------

***************************************
FUNCTION SAIDA2
***************************************

LOCAL LC,LB,CE,CD
LC:=1
LB:=MAXROW()-1
CE:=1
CD:=MAXCOL()-2
SETCOLOR("W/N,N/W,N/N,N/N,N/W") 
SETCURSOR(0)
DO WHILE LC<(MAXROW()/2)+1
   SCROLL(0,0,LC,79,0)
   SCROLL(0,0,24,CE,0)
   SCROLL(LB,0,24,79,0)
   SCROLL(0,CD,24,79,0)
   LC:=LC+0.1
   LB:=LB-0.1
   CE:=CE+0.2
   CD:=CD-0.2
ENDDO 
SETCURSOR(1)
RETURN(.T.)

*//--------------------------- FIM DA FUNCAO SAIDA2 ---------------------------

***********************************
FUNCTION SAIDA3
***********************************

LOCAL CE,CD
CE:=1
CD:=MAXCOL()-2
SETCOLOR("W/N,N/W,N/N,N/N,N/W") 
SETCURSOR(0)
DO WHILE CE<(MAXCOL()/2)+1
   SCROLL(0,0,24,CE,0)
   SCROLL(0,CD,24,79,0)
   CE:=CE+0.2
   CD:=CD-0.2
ENDDO
SETCURSOR(1)
RETURN(.T.)

*//--------------------------- FIM DA FUNCAO SAIDA3 ---------------------------

*************************************
FUNCTION SAIDA4
*************************************

SETCOLOR("W/N,N/W,N/N,N/N,N/W") 
SETCURSOR(0)
FOR X:=1 TO MAXROW()+1
    SCROLL(0,0,24,79,1)
NEXT
SETCURSOR(1)
RETURN(.T.)

*//---------------------------- FIM DA FUNCAO SAIDA4 ------------------------- 

*************************************
FUNCTION SAIDA5
*************************************

SETCOLOR("W/N,N/W,N/N,N/N,N/W")
SETCURSOR(0)
FOR X:=1 TO MAXROW()+1
    SCROLL(0,0,24,79,-1)
NEXT
SETCURSOR(1)
RETURN(.T.)

*//---------------------------- FIM DA FUNCAO SAIDA5 -------------------------

*************************************
FUNCTION SAIDA6
*************************************

SETCOLOR("W/N,N/W,N/N,N/N,N/W")
SETCURSOR(0)
FOR I:=1 TO (MAXROW()/2)+1
  SCROLL(0,0,12,79,-1)
  SCROLL(12,0,24,79,1)
NEXT
SETCURSOR(1)
RETURN(.T.)

*//---------------------------- FIM DA FUNCAO SAIDA6 --------------------------

*************************
FUNCTION MAKE_MENU
*************************

PARAMETERS LIN,COL,MATRIZ,VAR,EL,BOX,COR,HLP
VETOR1:={}
VETOR2:={}
VETOR3:={}
VETOR4:={}
FOR X:=1 TO LEN(MATRIZ)
    AADD(VETOR1,MATRIZ[X,1])
    AADD(VETOR2,MATRIZ[X,2]:=IF(MATRIZ[X,2]==NIL,SPACE(10),MATRIZ[X,2]))
    AADD(VETOR3,MATRIZ[X,3]:=IF(MATRIZ[X,3]==NIL,.T.,MATRIZ[X,3]))
    AADD(VETOR4,MATRIZ[X,4])
NEXT
BOX:=IF(BOX==NIL,CAIXA6,BOX)
COR:=IF(COR==NIL,COLOR2,COR)
EL:=IF(EL==NIL,1,EL)
LIN1:=LIN+LEN(MATRIZ)+1
IF LIN1>22
   LIN1=22
ENDIF
COL1:=COL+LEN(VETOR1[1])+1
T1:=SAVESCREEN(LIN,COL,LIN1+1,COL1+3)
COLOR:=SETCOLOR()
IF VETOR3[EL]<>.F.
   @ MAXROW(),0 SAY PADC(VETOR2[EL],MAXCOL())
ELSE
   P=ASCAN(VETOR3,.T.)
   IF P<>0
       @ MAXROW(),0 SAY PADC(VETOR2[P],MAXCOL())
   ENDIF
ENDIF
RETCOLOR(LIN,COL,LIN1,COL1+1,BOX,COR)
SOMBRA(LIN,COL,LIN1,COL1+1)
SETCOLOR(COR)
ACHOICE(LIN+1,COL+1,LIN1,COL1,VETOR1,VETOR3,"FUNCAO",EL)
FUNCTION FUNCAO
PARAMETERS MODO,ELE,POSI
IF MODO=0
   SETCOLOR(COLOR)
   @ MAXROW(),0 SAY PADC(VETOR2[ELE],MAXCOL())
   SETCOLOR(COR)
ELSEIF MODO=1
          KEYBOARD CHR(23)
ELSEIF MODO=2
          KEYBOARD CHR(29)
ELSEIF MODO=4
   TECLA:=0 
   DO WHILE TECLA<>4 .AND. TECLA<>19 .AND. TECLA<>27 
      TECLA:=INKEY()
   ENDDO
ENDIF
IF LASTKEY()=4
   RESTSCREEN(LIN,COL,LIN1+1,COL1+3,T1)
   EL:=ELE
   SETCOLOR(COLOR)
   KEYBOARD CHR(4)+CHR(13) 
   RETURN(.T.)
ELSEIF LASTKEY()=19
   RESTSCREEN(LIN,COL,LIN1+1,COL1+3,T1)
   EL:=ELE
   SETCOLOR(COLOR)
   KEYBOARD CHR(19)+CHR(13) 
   RETURN(.T.)
ELSEIF LASTKEY()=27
   RESTSCREEN(LIN,COL,LIN1+1,COL1+3,T1)
   EL:=ELE
   SETCOLOR(COLOR)
   @ MAXROW(),0 SAY SPACE(MAXCOL())
   RETURN(.T.)
ELSEIF LASTKEY()=13
   *EVAL(VETOR4[ELEM])
   *SETCOLOR(COR) 
   RESTSCREEN(LIN,COL,LIN1+1,COL1+3,T1)
   VAR:=ELE
   SETCOLOR(COLOR)
   RETURN(.T.)   
ENDIF
RETURN(2)

*//------------------------ FIM DA FUNCAO MAKE_MENU ---------------------------

*************************
FUNCTION MAKE_M
*************************

PARAMETERS LINM,COLM,MATRIZM,VARM,ELEM,BOXM,CORM,HLP
VETOR11:={}
VETOR21:={}
VETOR31:={}
VETOR41:={}
FOR X:=1 TO LEN(MATRIZM)
    AADD(VETOR11,MATRIZM[X,1])
    AADD(VETOR21,MATRIZM[X,2]:=IF(MATRIZM[X,2]==NIL,SPACE(10),MATRIZM[X,2]))
    AADD(VETOR31,MATRIZM[X,3]:=IF(MATRIZM[X,3]==NIL,.T.,MATRIZM[X,3]))
    AADD(VETOR41,MATRIZM[X,4])
NEXT
BOXM:=IF(BOXM==NIL,CAIXA6,BOXM)
CORM:=IF(CORM==NIL,COLOR2,CORM)
ELEM:=IF(ELEM==NIL,1,ELEM)
LIN1M:=LINM+LEN(MATRIZM)+1
IF LIN1M>22
   LIN1M=22
ENDIF
COL1M:=COLM+LEN(VETOR11[1])+1
T2:=SAVESCREEN(LINM,COLM,LIN1M+1,COL1M+3)
COLOR:=SETCOLOR()
IF VETOR31[ELEM]<>.F.
   @ MAXROW(),0 SAY PADC(VETOR21[ELEM],MAXCOL())
ELSE
   P=ASCAN(VETOR31,.T.)
   IF P<>0
       @ MAXROW(),0 SAY PADC(VETOR21[P],MAXCOL())
   ENDIF
ENDIF
RETCOLOR(LINM,COLM,LIN1M,COL1M+1,BOXM,CORM)
SOMBRA(LINM,COLM,LIN1M,COL1M+1)
SETCOLOR(CORM)
ACHOICE(LINM+1,COLM+1,LIN1M,COL1M,VETOR11,VETOR31,"FUNCAO2",ELEM)
FUNCTION FUNCAO2
PARAMETERS MODO,ELE,POSI
IF MODO=0
   SETCOLOR(COLOR)
   @ MAXROW(),0 SAY PADC(VETOR21[ELE],MAXCOL())
   SETCOLOR(CORM)
ELSEIF MODO=1
          KEYBOARD CHR(23)
ELSEIF MODO=2
          KEYBOARD CHR(29)
ELSEIF MODO=4
   TECLA:=0 
   DO WHILE TECLA<>4 .AND. TECLA<>19 .AND. TECLA<>27 
      TECLA:=INKEY()
   ENDDO
ENDIF
IF LASTKEY()=4
   RESTSCREEN(LINM,COLM,LIN1M+1,COL1M+3,T2)
   ELEM:=ELE
   SETCOLOR(COLOR)
   KEYBOARD CHR(4)+CHR(13) 
   RETURN(.T.)
ELSEIF LASTKEY()=19
   RESTSCREEN(LINM,COLM,LIN1M+1,COL1M+3,T2)
   ELEM:=ELE
   SETCOLOR(COLOR)
   KEYBOARD CHR(19)+CHR(13) 
   RETURN(.T.)
ELSEIF LASTKEY()=27
   RESTSCREEN(LINM,COLM,LIN1M+1,COL1M+3,T2)
   ELEM:=ELE
   SETCOLOR(COLOR)
   @ MAXROW(),0 SAY SPACE(MAXCOL())
   RETURN(.T.)
ELSEIF LASTKEY()=13
   EVAL(VETOR41[ELE])
   SETCOLOR(COLOR)
   @ MAXROW(),0 SAY PADC(VETOR21[ELE],MAXCOL())
   SETCOLOR(CORM) 
  *KEYBOARD CHR(24)+CHR(5)
ENDIF
RETURN(2)

*//------------------------ FIM DA FUNCAO MAKE_M ------------------------------

**********************************
FUNCTION MAKE_MENU1
**********************************

PARAMETERS LIN2,COL2,MATRIZ2,BOX2,COR2,HLP
VETOR12:={}
VETOR22:={}
VETOR32:={}
VETOR42:={}
FOR X:=1 TO LEN(MATRIZ2)
    AADD(VETOR12,MATRIZ2[X,1])
    AADD(VETOR22,MATRIZ2[X,2]:=IF(MATRIZ2[X,2]==NIL,SPACE(10),MATRIZ2[X,2]))
    AADD(VETOR32,MATRIZ2[X,3]:=IF(MATRIZ2[X,3]==NIL,.T.,MATRIZ2[X,3]))
    AADD(VETOR42,MATRIZ2[X,4])
NEXT
BOX2:=IF(BOX2==NIL,CAIXA6,BOX2)
COR2:=IF(COR2==NIL,COLOR2,COR2)
LIN12:=LIN2+LEN(MATRIZ2)+1
COL12:=COL2+LEN(VETOR12[1])+1
T3:=SAVESCREEN(LIN2,COL2,LIN12+1,COL12+3)
COLOR:=SETCOLOR()
P=ASCAN(VETOR32,.T.)
IF P<>0
   @ MAXROW(),0 SAY PADC(VETOR22[P],MAXCOL())
ENDIF
RETCOLOR(LIN2,COL2,LIN12,COL12+1,BOX2,COR2)
SOMBRA(LIN2,COL2,LIN12,COL12+1)
SETCOLOR(COR2)
ACHOICE(LIN2+1,COL2+1,LIN12,COL12,VETOR12,VETOR32,"FUNCAO1")
FUNCTION FUNCAO1
PARAMETERS MODO,ELE,POSI
IF MODO=0
   SETCOLOR(COLOR)
   @ MAXROW(),0 SAY PADC(VETOR22[ELE],MAXCOL())
   SETCOLOR(COR2)
ELSEIF MODO=1
   KEYBOARD CHR(23)
ELSEIF MODO=2
   KEYBOARD CHR(29)
ELSEIF MODO=4
   TECLA:=0 
   DO WHILE TECLA<>27 
      TECLA:=INKEY()
   ENDDO
ENDIF
IF LASTKEY()=27
   RESTSCREEN(LIN2,COL2,LIN12+1,COL12+3,T3)
   SETCOLOR(COLOR)
   @ MAXROW(),0 SAY SPACE(MAXCOL())
   RETURN(.T.)
ELSEIF LASTKEY()=13
   ** RESTSCREEN(LIN2,COL2,LIN12+1,COL12+3,T3)
   EVAL(VETOR42[ELE])
   ** SETCOLOR(COLOR)
   ** RETURN(.T.)
ENDIF
RETURN(2)
*//------------------------- FIM DA FUNCAO MAKE_MENU1 -------------------------

************************************
FUNCTION DOS
************************************

PRIVATE COR_ATU,TELA_ATU,CURSOR,COMANDO
COR_ATU:=SETCOLOR()
CURSOR:=SETCURSOR()
TELA_ATU:=SAVESCREEN(0,0,MAXROW(),MAXCOL())
COMANDO:=GETE("COMSPEC")
SETCOLOR("W/N,N/W,N/N,N/N,N/W")
CLEAR SCREEN
SOM()
@ 00,00 SAY "Digite <EXIT> para retornar ao sistema"
SETCURSOR(1)
RUN &COMANDO
SETCOLOR(COR_ATU)
SETCURSOR(CURSOR)
RESTSCREEN(0,0,MAXROW(),MAXCOL(),TELA_ATU)
RETURN(.T.)

*//------------------------- FIM DA FUNCAO DOS --------------------------------

*****************************************
FUNCTION SOMBCOLOR(LIN,COL,LIN1,COL1,COR)
*****************************************

COR:=IF(COR==NIL,COLOR1,COR)
COLOR:=SETCOLOR()
SETCOLOR(COR)
SCROLL(LIN1+1,COL+2,LIN1+1,COL1+2)
SCROLL(LIN+1,COL1+1,LIN1,COL1+2)
SETCOLOR(COLOR)
RETURN(.T.)

*//------------------------- FIM DA FUNCAO SOMBCOLOR --------------------------

**************************************
FUNCTION DIAEXT
**************************************

LOCAL DIA,DIASEM
DIA:=DOW(DATE())
DIASEM:={"Domingo","Segunda","Terca","Quarta","Quinta","Sexta","Sabado"}
RETURN(DIASEM[DIA])

*//--------------------------- FIM DA FUNCAO DIASEM -------------------------  

****************************************
FUNCTION MESEXT
****************************************

LOCAL MES,MESEX
MES:=MONTH(DATE())
MESEX:={"Janeiro","Fevereiro","Marco","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"}
RETURN(MESEX[MES])

*//----------------------------- FIM DA FUNCAO MESEXT -------------------------

********************************
FUNCTION DATAEXT
********************************

LOCAL DATAEX
DATAEX:=STR(DAY(DATE()))+" de "+MESEXT()+" de"+STR(YEAR(DATE()))
RETURN(DATAEX)

*//---------------------- FIM DA FUNCAO DATAEXT -------------------------------

******************************
FUNCTION CONFIRM(COR)
******************************

LOCAL COLOR,T4,CURSOR,LIN,COL,OP
COR:=IF(COR==NIL,COLOR1,COR)
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
LIN:=MAXROW()/2
COL:=MAXCOL()/2
OP:=0
T4:=SAVESCREEN(LIN-2,COL-10,LIN+5,COL+12)
RETCOLOR(LIN-2,COL-10,LIN,COL+10,CAIXA1,COR)
RETCOLOR(LIN,COL-10,LIN+4,COL+10,CAIXA2,COR)
SOMBRA(LIN-2,COL-10,LIN+4,COL+10)
SETCOLOR(COR)
@ 11,35 SAY "Confirma ?"
@ 14,33 PROMPT" SIM "
@ 14,42 PROMPT" NAO "
MENU TO OP
IF OP=0
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T4)
   RETURN(.F.)
ELSEIF OP=1
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T4)
   RETURN(.T.) 
ELSEIF OP=2
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T4)
   RETURN(.F.)
ENDIF
     
*//--------------------------- FIM DA FUNCAO CONFIRM --------------------------

*******************************
FUNCTION NAO(COR,BOX)
*******************************

COR:=IF(COR==NIL,COLOR1,COR)
BOX:=IF(BOX==NIL,CAIXA3,BOX)
MENSAGEM("MODULO NAO DISPONIVEL",COR,BOX,2)
RETURN(.T.)

*//---------------------------- FIM DA FUNCAO NAO -----------------------------

*******************************
FUNCTION SOM
*******************************

TONE(350,5) 
RETURN(.T.)

*//----------------------------- FIM DA FUNCAO SOM ----------------------------

*******************************
FUNCTION NVZ(VAR)
*******************************

IF VAR=NIL
   RETURN(.F.)
ENDIF
IF EMPTY(VAR)
   RETURN(.F.)
ELSE
   RETURN(.T.)
ENDIF

*//---------------------------- FIM DA FUNCAO NVZ -----------------------------

*******************************
FUNCTION HORAS
*******************************

H:=TIME()
HORA:=SUBSTR(H,1,2)
MINUTO:=SUBSTR(H,4,2)
SEGUNDO:=SUBSTR(H,7,2)
HORAEXT:=HORA + " " + "Hora(s)" + "," + MINUTO + " " + "Minuto(s)" + " e " + SEGUNDO + " " + "Segundo(s)"
RETURN(HORAEXT)

*//-------------------------- FIM DA FUNCAO HORAS -----------------------------

*******************************
FUNCTION ESCPRINT(COR)
*******************************

LOCAL COLOR,T5,CURSOR,LIN,COL,OP
SET DEVICE TO SCREEN
COR:=IF(COR==NIL,COLOR1,COR)
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
LIN:=MAXROW()/2
COL:=MAXCOL()/2
T5:=SAVESCREEN(LIN-2,COL-10,LIN+5,COL+12)
OP:=0
RETCOLOR(LIN-2,COL-10,LIN,COL+10,CAIXA1,COR)
RETCOLOR(LIN,COL-10,LIN+4,COL+10,CAIXA2,COR)
SOMBRA(LIN-2,COL-10,LIN+4,COL+10)
SETCOLOR(COR)
@ 11,35 SAY "Cancela ?"
@ 14,33 PROMPT" SIM "
@ 14,42 PROMPT" NAO "
MENU TO OP
IF OP=0
   SET DEVICE TO PRINT
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T5)
   RETURN(.F.)
ELSEIF OP=1
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T5)
   RETURN(.T.) 
ELSEIF OP=2
   SET DEVICE TO PRINT
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T5)
   RETURN(.F.)
ENDIF
*//---------------------------- FIM DA FUNCAO ESCPRINT ------------------------

****************************************
FUNCTION FIM(COR,VAR)
****************************************

LOCAL COLOR,T6,CURSOR,LIN,COL,OP
COR:=IF(COR==NIL,COLOR1,COR)
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
LIN:=MAXROW()/2
COL:=MAXCOL()/2
OP:=0
T6:=SAVESCREEN(LIN-2,COL-10,LIN+5,COL+12)
RETCOLOR(LIN-2,COL-10,LIN,COL+10,CAIXA1,COR)
RETCOLOR(LIN,COL-10,LIN+4,COL+10,CAIXA2,COR)
SOMBRA(LIN-2,COL-10,LIN+4,COL+10)
SETCOLOR(COR)
@ 11,35 SAY "Finaliza ?"
@ 14,33 PROMPT" SIM "
@ 14,42 PROMPT" NAO "
MENU TO OP
IF OP=0
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T6)
   RETURN(.F.)
ELSEIF OP=1
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T6)
   RETURN(.T.) 
ELSEIF OP=2
   SETCOLOR(COLOR) 
   SETCURSOR(CURSOR)
   RESTSCREEN(LIN-2,COL-10,LIN+5,COL+12,T6)
   RETURN(.F.)
ENDIF
     
*//--------------------------- FIM DA FUNCAO FIM ------------------------------

*******************************************
FUNCTION HORIZONTAL(LIN,MESS,COR,BOX,TEMPO)
*******************************************

LOCAL CURSOR,COLOR,LIN1,LIN2,COL1,T7,TECLA,AUX
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
MESS:=IF(MESS==NIL,"Faltou a mensagem...",MESS)
COR:=IF(COR==NIL,COLOR1,COR)
BOX:=IF(BOX==NIL,CAIXA3,BOX)
TEMPO:=IF(TEMPO==NIL,.1,TEMPO)
LIN1:=LIN-1
COL:=(MAXCOL()/2)-LEN(MESS)/2
LIN2:=LIN+1
COL1:=(MAXCOL()/2)+LEN(MESS)/2
T7:=SAVESCREEN(LIN1,COL-2,LIN2+1,COL1+3)
RETCOLOR(LIN1,COL-2,LIN2,COL1+1,BOX,COR)
SOMBRA(LIN1,COL-2,LIN2,COL1+1)
TECLA:=0
SETCOLOR(COR)
SETCURSOR(0)
DO WHILE TECLA=0
   @ LIN,COL SAY MESS
   AUX:=LEFT(MESS,1)
   MESS:=SUBSTR(MESS,2,LEN(MESS))+AUX
   INKEY(TEMPO)
   TECLA:=LASTKEY()
ENDDO
SETCOLOR(COLOR)
SETCURSOR(CURSOR)
RESTSCREEN(LIN1,COL-2,LIN2+1,COL1+3,T7)
RETURN(.T.)

*//---------------------------- FIM DA FUNCAO HORIZONTAL -------------------

*****************************************
FUNCTION VERTICAL(COL,MESS,COR,BOX,TEMPO)
*****************************************

LOCAL CURSOR,COLOR,LIN,LIN1,COL1,COL2,T8,TECLA,AUX
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
MESS:=IF(MESS==NIL,"Faltou a mensagem...",MESS)
COR:=IF(COR==NIL,COLOR1,COR)
BOX:=IF(BOX==NIL,CAIXA3,BOX)
TEMPO:=IF(TEMPO==NIL,.1,TEMPO)
LIN:=(MAXROW()/2)-LEN(MESS)/2
COL1:=COL-2
LIN1:=(MAXROW()/2)+LEN(MESS)/2
COL2:=COL+2
T8:=SAVESCREEN(LIN,COL1,LIN1+2,COL2+2)
RETCOLOR(LIN,COL1,LIN1+1,COL2,BOX,COR)
SOMBRA(LIN,COL1,LIN1+1,COL2)
TECLA:=0
SETCOLOR(COR)
SETCURSOR(0)
LINPER:=LIN
DO WHILE TECLA=0
    FOR X:=1 TO LEN(MESS)
        @ LIN+1,COL SAY SUBSTR(MESS,X,1)
        LIN:=LIN+1
    NEXT 
    AUX:=LEFT(MESS,1)
    MESS:=SUBSTR(MESS,2,LEN(MESS))+AUX
    INKEY(TEMPO)
    TECLA:=LASTKEY()
    LIN:=LINPER
ENDDO
SETCOLOR(COLOR)
SETCURSOR(CURSOR)
RESTSCREEN(LIN,COL1,LIN1+2,COL2+2,T8)
RETURN(.T.)

*//------------------------------- FIM DA FUNCAO VERTICAL ---------------------

*******************************************************
FUNCTION PINTAHOR(LIN,MESS,COR1,COR2,COR3,BOX,TEMPO)
*******************************************************

LOCAL COLOR,CURSOR,LIN1,COL,LIN2,COL1,T9,TECLA
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
MESS:=IF(MESS==NIL,"Faltou a mensagem...",MESS)
COR1:=IF(COR1==NIL,COLOR1,COR1)
COR2:=IF(COR2==NIL,COLOR1,COR2)
COR3:=IF(COR3==NIL,COLOR3,COR3)
BOX:=IF(BOX==NIL,CAIXA3,BOX)
TEMPO:=IF(TEMPO==NIL,0.5,TEMPO)
LIN1:=LIN-1
COL:=(MAXCOL()/2)-LEN(MESS)/2
LIN2:=LIN+1
COL1:=(MAXCOL()/2)+LEN(MESS)/2
T9:=SAVESCREEN(LIN1,COL-2,LIN2+1,COL1+3)
RETCOLOR(LIN1,COL-2,LIN2,COL1+1,BOX,COR1)
SOMBRA(LIN1,COL-2,LIN2,COL1+1)
SETCOLOR(COR2)
@ LIN,COL SAY MESS
TECLA:=0
SETCURSOR(0)
DO WHILE TECLA=0
   SETCOLOR(COR3)
   FOR X:=1 TO LEN(MESS)
       @ LIN,COL-1+X SAY SUBSTR(MESS,X,1)
   NEXT
   INKEY(TEMPO)
   SETCOLOR(COR2)
   FOR X:=1 TO LEN(MESS)
       @ LIN,COL-1+X SAY SUBSTR(MESS,X,1)
   NEXT
   TECLA:=LASTKEY()
   INKEY(TEMPO)
ENDDO
SETCOLOR(COLOR)
SETCURSOR(CURSOR)
RESTSCREEN(LIN1,COL-2,LIN2+1,COL1+3,T9)
RETURN(.T.)

*//------------------------- FIM DA FUNCAO PINTAHOR ----------------------------

*******************************************************
FUNCTION PINTAVER(COL,MESS,COR1,COR2,COR3,BOX,TEMPO)
*******************************************************

LOCAL COLOR,CURSOR,LIN,LIN1,COL1,T10,TECLA
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
MESS:=IF(MESS==NIL,"Faltou a mensagem...",MESS)
COR1:=IF(COR1==NIL,COLOR1,COR1)
COR2:=IF(COR2==NIL,COLOR1,COR2)
COR3:=IF(COR3==NIL,COLOR3,COR3)
BOX:=IF(BOX==NIL,CAIXA3,BOX)
TEMPO:=IF(TEMPO==NIL,0.5,TEMPO)
LIN:=(MAXROW()/2)-LEN(MESS)/2
COL1:=COL-2
LIN1:=(MAXROW()/2)+LEN(MESS)/2
COL2:=COL+2
T10:=SAVESCREEN(LIN,COL1,LIN1+2,COL2+2)
RETCOLOR(LIN,COL1,LIN1+1,COL2,BOX,COR1)
SOMBRA(LIN,COL1,LIN1+1,COL2)
SETCOLOR(COR2)
SETCURSOR(0)
LINPER:=LIN
FOR X:=1 TO LEN(MESS)
    @ LIN+1,COL SAY SUBSTR(MESS,X,1)
    LIN:=LIN+1
NEXT
TECLA:=0
DO WHILE TECLA=0
   LIN:=LINPER
   SETCOLOR(COR3)
   FOR X:=1 TO LEN(MESS)
        @ LIN+1,COL SAY SUBSTR(MESS,X,1)
        LIN:=LIN+1
   NEXT
   INKEY(TEMPO)
   SETCOLOR(COR2)
   LIN:=LINPER
   FOR X:=1 TO LEN(MESS)
        @ LIN+1,COL SAY SUBSTR(MESS,X,1)
        LIN:=LIN+1
   NEXT
   TECLA:=LASTKEY()
   INKEY(TEMPO)
   LIN:=LINPER
ENDDO
SETCOLOR(COLOR)
SETCURSOR(CURSOR)
RESTSCREEN(LIN,COL1,LIN1+2,COL2+2,T10)
RETURN(.T.)

*//------------------------- FIM DA FUNCAO PINTAVER ----------------------------

*******************************
FUNCTION SN(VAR)
*******************************

IF VAR=NIL
   RETURN(.F.)
ENDIF
IF VAR="S" .OR. VAR="s" .OR. VAR="N" .OR. VAR="n"
   RETURN(.T.)
ELSE
   RETURN(.F.)
ENDIF

*//------------------------- FIM DA FUNCAO SN ---------------------------------

************************
FUNCTION INSERCAO()
************************
IF SETCURSOR()<>0
   SETCURSOR(IF(READINSERT(!READINSERT()),1,3))
ENDIF
RETURN(.T.)

*//------------------------- FIM DA FUNCAO INSERCAO ------------------------------

************************
FUNCTION CLOCK(COR,BOX)
************************
LOCAL W_COLUNA,COLOR,CURSOR,T11,LIN,COL,LIN1,COL1
*F3
SETKEY(-2,NIL)
COR:=IF(COR==NIL,COLOR1,COR)
BOX:=IF(BOX==NIL,CAIXA3,BOX)
LIN:=MAXROW()/2-5
COL:=MAXCOL()/2-29
LIN1:=MAXROW()/2+5
COL1:=MAXCOL()/2+29
T11:=SAVESCREEN(LIN,COL,LIN1+2,COL1+2)
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
SETCURSOR(0)
RETCOLOR(LIN,COL,LIN1,COL1,BOX,COR)
SOMBRA(LIN,COL,LIN1,COL1)
DECLARE W_HORA[8]
SETCOLOR(COR)
DO WHILE .T. 
   W_COLUNA:= 8
   FOR I=1 TO 8
       W_HORA[I]=SUBSTR(TIME(),I,1)
       DO CASE
	  CASE I = 1
	       W_COLUNA:= 12
	  CASE I = 2
	       W_COLUNA:= 20
	  CASE I = 3
	       W_COLUNA:= 28
	  CASE I = 4
	       W_COLUNA:= 32
	  CASE I = 5
	       W_COLUNA:= 40
	  CASE I = 6
	       W_COLUNA:= 48
	  CASE I = 7
	       W_COLUNA:= 52
	  CASE I = 8
	       W_COLUNA:= 60
       ENDCASE
       DO CASE
	  CASE W_HORA[I] = ':'
	       @ 09,W_COLUNA      SAY '   '   
	       @ ROW()+1,W_COLUNA SAY '   '   
	       @ ROW()+1,W_COLUNA SAY '€€€'   
	       @ ROW()+1,W_COLUNA SAY '   '   
	       @ ROW()+1,W_COLUNA SAY '€€€'   
	       @ ROW()+1,W_COLUNA SAY '   '   
	       @ ROW()+1,W_COLUNA SAY '   '   
	  CASE W_HORA[I] = '1'
	       @ 09,W_COLUNA      SAY '  €€   '
	       @ ROW()+1,W_COLUNA SAY '  €€   '
	       @ ROW()+1,W_COLUNA SAY '  €€   '
	       @ ROW()+1,W_COLUNA SAY '       '
	       @ ROW()+1,W_COLUNA SAY '  €€   '
	       @ ROW()+1,W_COLUNA SAY '  €€   '
	       @ ROW()+1,W_COLUNA SAY '  €€   '
	  CASE W_HORA[I] = '2'
	       @ 09,W_COLUNA      SAY '€€€€€€ '
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	       @ ROW()+1,W_COLUNA SAY '€€     '
	       @ ROW()+1,W_COLUNA SAY '€€     '
	       @ ROW()+1,W_COLUNA SAY ' €€€€€€'
	  CASE W_HORA[I] = '3'
	       @ 09,W_COLUNA      SAY '€€€€€€ '
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY '€€€€€€ '
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY '€€€€€€ '
	  CASE W_HORA[I] = '4'
	       @ 09,W_COLUNA      SAY '€€   €€'
	       @ row()+1,W_COLUNA SAY '€€   €€'
	       @ row()+1,W_COLUNA SAY '€€   €€'
	       @ row()+1,W_COLUNA SAY ' €€€€€ '
	       @ row()+1,W_COLUNA SAY '     €€'
	       @ row()+1,W_COLUNA SAY '     €€'
	       @ row()+1,W_COLUNA SAY '     €€'
	  CASE W_HORA[I] = '5'
	       @ 09,W_COLUNA      SAY ' €€€€€ '
	       @ ROW()+1,W_COLUNA SAY '€€     '
	       @ ROW()+1,W_COLUNA SAY '€€     '
	       @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY '     €€'
	       @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	  CASE W_HORA[I] = '6'
	       @ 09,W_COLUNA      SAY ' €€€€€ '
	       @ ROW()+1,W_COLUNA SAY '€€     '
	       @ ROW()+1,W_COLUNA SAY '€€     '
	       @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	       @ ROW()+1,W_COLUNA SAY '€€   €€' 
	       @ ROW()+1,W_COLUNA SAY '€€   €€'
	       @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	  CASE W_HORA[I] = '7'
	       @ 09,W_COLUNA      SAY '€€€€€€€'
	       @ row()+1,W_COLUNA SAY '     €€'
	       @ row()+1,W_COLUNA SAY '     €€'
	       @ row()+1,W_COLUNA SAY '       '
	       @ row()+1,W_COLUNA SAY '     €€'       
	       @ row()+1,W_COLUNA SAY '     €€'        
	       @ row()+1,W_COLUNA SAY '     €€'
	 CASE W_HORA[I] = '8'
	      @ 09,W_COLUNA      SAY ' €€€€€ '
	      @ ROW()+1,W_COLUNA SAY '€€   €€'
	      @ ROW()+1,W_COLUNA SAY '€€   €€'
	      @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	      @ ROW()+1,W_COLUNA SAY '€€   €€' 
	      @ ROW()+1,W_COLUNA SAY '€€   €€'  
	      @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	 CASE W_HORA[I] = '9'
	      @ 09,W_COLUNA      SAY ' €€€€€ '
	      @ ROW()+1,W_COLUNA SAY '€€   €€'
	      @ ROW()+1,W_COLUNA SAY '€€   €€'
	      @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	      @ ROW()+1,W_COLUNA SAY '     €€'  
	      @ ROW()+1,W_COLUNA SAY '     €€' 
	      @ ROW()+1,W_COLUNA SAY ' €€€€€ '
	 CASE W_HORA[I] = '0'
	      @ 09,W_COLUNA      SAY ' €€€€€ '
	      @ row()+1,W_COLUNA SAY '€€   €€'
	      @ row()+1,W_COLUNA SAY '€€   €€'
	      @ row()+1,W_COLUNA SAY '       '
	      @ row()+1,W_COLUNA SAY '€€   €€' 
	      @ row()+1,W_COLUNA SAY '€€   €€'  
	      @ row()+1,W_COLUNA SAY ' €€€€€ '
       ENDCASE
       IF LASTKEY()=27 .OR.INKEY()=27 .OR. NEXTKEY()=27
	  SETCOLOR(COLOR)
	  SETCURSOR(CURSOR)
	  RESTSCREEN(LIN,COL,LIN1+2,COL1+2,T11)
     SETKEY(-2,{|| CLOCK(COR,BOX)})
	  RETURN(.T.)
       ENDIF
   NEXT
ENDDO

*//------------------------- FIM DA FUNCAO CLOCK ------------------------------

******************************
FUNCTION CALC
******************************
LOCAL LIN,LIN1,COL,COL1,COLOR,CURSOR,T12
CLEAR GETS
*F4
SETKEY(-3,NIL)
LIN:=MAXROW()/2-7
LIN1:=MAXROW()/2+7
COL:=MAXCOL()/2-12
COL1:=MAXCOL()/2+12
COLOR:=SETCOLOR()
CURSOR:=SETCURSOR()
T12:=SAVESCREEN(LIN-1,COL-1,LIN1+1,COL1+2)
SETCOLOR("W/N,N/W,N/N,N/N,N/W")
SETCURSOR(1)
RETCOLOR(LIN,COL,LIN1,COL1,"€€€€€€€€","BG,BG")
RETCOLOR(LIN+1,COL+1,LIN1-1,COL1-1,"€€€€€€€€€","B,B")
RETCOLOR(LIN+2,COL+2,LIN1-10,COL1-2,"€ﬂ€€€€€","BG,BG")
RETCOLOR(LIN+12,COL+5,LIN1-2,COL1-17,"        ","W+/R+")
RETCOLOR(LIN+12,COL+9,LIN1-2,COL1-13,"        ","W+/R+")
RETCOLOR(LIN+12,COL+13,LIN1-2,COL1-9,"        ","W+/R+")
RETCOLOR(LIN+12,COL+17,LIN1-2,COL1-05,"        ","W+/W+")
RETCOLOR(LIN+10,COL+5,LIN1-4,COL1-17,"        ","W+/R+")
RETCOLOR(LIN+10,COL+9,LIN1-4,COL1-13,"        ","W+/R+")
RETCOLOR(LIN+10,COL+13,LIN1-4,COL1-9,"        ","W+/R+")
RETCOLOR(LIN+10,COL+17,LIN1-4,COL1-05,"        ","W+/W+")
RETCOLOR(LIN+8,COL+5,LIN1-6,COL1-17,"        ","W+/R+")
RETCOLOR(LIN+8,COL+9,LIN1-6,COL1-13,"        ","W+/R+")
RETCOLOR(LIN+8,COL+13,LIN1-6,COL1-9,"        ","W+/R+")
RETCOLOR(LIN+8,COL+17,LIN1-6,COL1-05,"        ","W+/W+")
RETCOLOR(LIN+6,COL+5,LIN1-8,COL1-17,"        ","W+/R+")
RETCOLOR(LIN+6,COL+9,LIN1-8,COL1-13,"        ","W+/R+")
RETCOLOR(LIN+6,COL+13,LIN1-8,COL1-9,"        ","W+/R+")
RETCOLOR(LIN+6,COL+17,LIN1-8,COL1-05,"        ","W+/W+")
SOMBRA(LIN,COL,LIN1,COL1)
@ LIN+6,COL+6 SAY "1" COLOR("W+/R")
@ LIN+6,COL+10 SAY "2" COLOR("W+/R")
@ LIN+6,COL+14 SAY "3" COLOR("W+/R")
@ LIN+6,COL+18 SAY "+" COLOR("N/W+")
@ LIN+8,COL+6 SAY "4" COLOR("W+/R")
@ LIN+8,COL+10 SAY "5" COLOR("W+/R")
@ LIN+8,COL+14 SAY "6" COLOR("W+/R")
@ LIN+8,COL+18 SAY "-" COLOR("N/W+")
@ LIN+10,COL+6 SAY "7" COLOR("W+/R")
@ LIN+10,COL+10 SAY "8" COLOR("W+/R")
@ LIN+10,COL+14 SAY "9" COLOR("W+/R")
@ LIN+10,COL+18 SAY "*" COLOR("N/W+")
@ LIN+12,COL+6 SAY "0" COLOR("W+/R")
@ LIN+12,COL+10 SAY "." COLOR("W+/R")
@ LIN+12,COL+13 SAY "ENT" COLOR("N/G")
@ LIN+12,COL+18 SAY "/" COLOR("N/W+")
OP1:=OP2:=OPERACAO:=0
OP3:=SPACE(1)
SET INTEN OFF
DO WHILE .T.
   @ LIN+3,COL+6 GET OP1 PICTURE "999,999,999.999"
   @ LIN+3,COL+4 GET OP3 PICTURE "X" VALID OP3="+".OR.OP3="-".OR.OP3="*".OR.OP3="/"
   @ LIN+3,COL+6 GET OP2 PICTURE "999,999,999.999"
   READ
   IF LASTKEY()=27
      KEYBOARD CHR(271) 
      EXIT
   ENDIF
   IF OP3="+"
      OPERACAO:=OP1+OP2
      @ LIN+3,COL+6 GET OPERACAO PICTURE "999,999,999.999"
      CLEAR GETS
   ELSEIF OP3="-"
          OPERACAO:=OP1-OP2
          @ LIN+3,COL+6 GET OPERACAO PICTURE "999,999,999.999"
          CLEAR GETS
    ELSEIF OP3="*"
          OPERACAO:=OP1*OP2
          @ LIN+3,COL+6 GET OPERACAO PICTURE "999,999,999.999"
          CLEAR GETS
    ELSEIF OP3="/"
           IF OP2=0
              OPARACA0:=0
              SOM()
           ELSE 
              OPERACAO:=OP1/OP2
           ENDIF   
    ENDIF
    OP3:=SPACE(1)
    OP1:=OPERACAO
    OP2:=OPERACAO:=0
    @ LIN+3,COL+4 SAY OP3 PICTURE "X" 
ENDDO
SETCOLOR(COLOR)
SETCURSOR(CURSOR)
RESTSCREEN(LIN-1,COL-1,LIN1+1,COL1+2,T12)
SETKEY(-3,{|| CALC()})
SET INTEN ON
RETURN(.T.)

*//------------------------- FIM DA FUNCAO CALC ------------------------------

***********************************
FUNCTION REGISTRO(AREA,V,MENS,C,CT)
***********************************

LOCAL SEL,CS,CR
SEL:=SELECT()
CS:=SETCURSOR()
CR:=SETCOLOR()
AREA:=IF(AREA==NIL,1,AREA)
MENS:=IF(MENS==NIL,"FALTOU A MENSAGEM",MENS)
C:=IF(C==NIL,COLOR1,C)
CT:=IF(CT==NIL,1,CT)
SELECT(AREA)
IF CT=1
   IF PROCURA(V)
      MENSAGEM(MENS,C,1,3) 
      SELECT(SEL)
      SETCURSOR(CS)
      SETCOLOR(CR) 
      RETURN(.F.)
   ELSE
      SELECT(SEL)
      SETCURSOR(CS)
      SETCOLOR(CR)
      RETURN(.T.)
   ENDIF
ELSE
   IF !PROCURA(V)
      MENSAGEM(MENS,C,1,3)
      SELECT(SEL)
      SETCURSOR(CS)
      SETCOLOR(CR)
      RETURN(.F.)
   ELSE 
      SELECT(SEL)
      SETCURSOR(CS)
      SETCOLOR(CR)
      RETURN(.T.)
   ENDIF
ENDIF

*//------------------------- FIM DA FUNCAO REGISTRO----------------------------