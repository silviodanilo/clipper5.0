***************************
FUNCTION HELP(A,B,C)
***************************

LOCAL COLOR,TELA,CURSOR,M,;
      E_HELP,CUR_ATU
AREA_ATU:=SELECT()
IF .NOT. FILE("HELP.DBF") .OR. .NOT. FILE("HELP.DBT")
   MENSAGEM("** HELP NAO FOI ENCONTRADO **",,,2)
   SELECT(AREA_ATU)
   RETURN NIL
ENDIF
IF .NOT. FILE("HELP.NTX")
   USE HELP.DBF NEW   
   INDEX ON CODIGO TO HELP
   USE
ENDIF
USE HELP INDEX HELP NEW
IF PROCURA(HLP)
   SETKEY(28,NIL)
   CURSOR :=SETCURSOR() 
   COLOR  :=SETCOLOR()
   TELA   :=SAVESCREEN(6,9,21,70)
   M      :=" PgDn  PgUp   "+CHR(25)+" "+CHR(24)+"  "+" ESC "
   E_HELP :=IF(GETENV("EDTHELP")=="ACTIVE",.T.,.F.)
   CUR_ATU:=IF(E_HELP,1,0)
   SETCURSOR(CUR_ATU)
   SETCOLOR("W/N,N/W,N/N,N/N,N/W")
   DISPBOX(6,09,21,70,2)
   IF E_HELP
      M+=" F2 "
      SETKEY(22,{|| INSERCAO()})
      @ 21,40 SAY M 
   ELSE
      @ 21,68-LEN(M) SAY M 
   ENDIF
   IF E_HELP
      REPLACE OBS WITH MEMOEDIT(OBS,7,10,20,69,E_HELP,"EDHELP")
      COMMIT
   ELSE
      MEMOEDIT(OBS,7,10,20,69,E_HELP)
   ENDIF
   SETKEY(22,NIL);SETKEY(28,{|| HELP()})
   SETCOLOR(COLOR)
   SETCURSOR(CURSOR)
   RESTSCREEN(6,9,21,70,TELA)
ELSE
   MENSAGEM("AJUDA AO USUARIO NAO ENCONTRADA!!",,,3)
ENDIF
USE
SELECT(AREA_ATU)
RETURN(NIL)

//-------------------------------- FUNCAO AUXILIAR ----------------------------

*****************************
FUNCTION EDHELP(MODO,LIN,COL)
*****************************

LOCAL TECLA:=LASTKEY(),RETVAL:=0,CUR:=SETCURSOR()
IF MODO==0
   SETCURSOR(0)
   @ 21,10 SAY "� Linha "+LTRIM(STR(LIN))+" Coluna "+LTRIM(STR(COL))+" �����"
   SETCURSOR(CUR)
ENDIF
IF TECLA==27
       RETVAL:=27
ELSEIF TECLA==23 .OR. TECLA==-1
       RETVAL:=23
ENDIF
RETURN(RETVAL)
